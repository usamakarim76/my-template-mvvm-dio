import 'package:dio/dio.dart';
import 'package:my_template/config/resources/app_logs.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    AppLogs.whiteLog('${options.method} request => $requestPath');
    AppLogs.errorLog('Error: ${err.error}, Message: ${err.message}');
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    AppLogs.whiteLog('${options.method} request => $requestPath');
    AppLogs.whiteLog('headers => ${options.headers}');
    options.data == null ? null : AppLogs.whiteLog('body => ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogs.successLog(
        'StatusCode: ${response.statusCode}, Data: ${response.data}');
    return super.onResponse(response, handler);
  }
}
