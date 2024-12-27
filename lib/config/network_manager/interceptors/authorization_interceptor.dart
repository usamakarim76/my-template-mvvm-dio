import 'package:dio/dio.dart';
import 'package:my_template/config/resources/app_strings.dart';
import 'package:my_template/services/storage/secure_storage_service.dart';

//* Request methods PUT, POST, PATCH, DELETE, GET needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    LocalStorage storage = LocalStorage();
    String? accessToken = await storage.readValue(AppStrings.accessToken);
    if (accessToken != null || accessToken == '') {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
