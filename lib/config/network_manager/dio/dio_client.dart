import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:my_template/config/network_manager/dio/dio_exception.dart';
import 'package:my_template/config/network_manager/dio/endpoints.dart';
import 'package:my_template/config/network_manager/interceptors/authorization_interceptor.dart';
import 'package:my_template/config/network_manager/interceptors/logger_interceptor.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout:
                const Duration(seconds: Endpoints.connectionTimeout),
            receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;
  final CancelToken _cancelToken = CancelToken();

  Future<T> request<T>({
    required String method,
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    dynamic body,
    T Function(dynamic data)? decoder,
  }) async {
    try {
      final options = Options(
        method: method,
        headers: headers,
      );
      final response = await _dio.request(
        url,
        queryParameters: queryParams,
        data: body,
        options: options,
        cancelToken: _cancelToken,
        onSendProgress: (sent, total) {},
      );

      if (decoder != null) {
        return decoder(response.data);
      }
      return response.data as T;
    } on DioException catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
