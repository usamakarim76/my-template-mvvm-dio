import 'package:my_template/config/models/auth_model/user_model.dart';
import 'package:my_template/config/network_manager/dio/dio_client.dart';
import 'package:my_template/config/network_manager/dio/endpoints.dart';

abstract class Authentication {
  Future<UserModel> login(Map<String, dynamic> loginData);
  Future<dynamic> register(Map<String, dynamic> registerData);
}

class AuthRepository implements Authentication {
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
    return response;
  }

  @override
  Future<dynamic> register(Map<String, dynamic> registerData) async {
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
