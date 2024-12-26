// import 'package:memory_cloud/config/apis_config/apis_config.dart';
import 'package:memory_cloud/config/network_manager/dio_client.dart';
import 'package:memory_cloud/config/network_manager/endpoints.dart';
// import 'package:memory_cloud/data/network/base_api_services.dart';
// import 'package:memory_cloud/data/network/network_api_services.dart';
import 'package:memory_cloud/models/auth_model/user_model.dart';

abstract class Authentication {
  Future<UserModel> login(Map<String, dynamic> loginData);
  Future<dynamic> register(Map<String, dynamic> registerData);
}

class AuthRepository implements Authentication {
  // final BaseApiServices _apiService = NetworkApiService();
  final DioClient _dioClient = DioClient();
  @override
  Future<UserModel> login(Map<String, dynamic> loginData) async {
    UserModel response = await _dioClient.request(
      method: 'POST',
      url: Endpoints.loginUrl,
      body: loginData,
      decoder: (data) {
        return UserModel.fromJson(data);
      },
    );
    // dynamic response =
    //     await _apiService.postApiResponse(ApiConfig.loginUrl, loginData);
    // return UserModel.fromJson(response);
    return response;
  }

  @override
  Future<dynamic> register(Map<String, dynamic> registerData) async {
    // dynamic response =
    //     await _apiService.postApiResponse(ApiConfig.signUpUrl, registerData);
    UserModel response = await _dioClient.request(
      method: 'POST',
      url: Endpoints.signUpUrl,
      body: registerData,
      decoder: (data) {
        return UserModel.fromJson(data);
      },
    );
    return response;
  }
}
