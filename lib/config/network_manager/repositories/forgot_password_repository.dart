import 'package:my_template/config/models/response_msg_model/response_message_model.dart';
import 'package:my_template/config/network_manager/dio/dio_client.dart';
import 'package:my_template/config/network_manager/dio/endpoints.dart';

abstract class ForgotPassword {
  Future<ResponseMessageModel> forgotPasswordStepFirst(
      Map<String, dynamic> forgotData);
}

class ForgotPasswordRepository implements ForgotPassword {
  final DioClient _dioClient = DioClient();
  @override
  Future<ResponseMessageModel> forgotPasswordStepFirst(
      Map<String, dynamic> forgotData) async {
    ResponseMessageModel response = await _dioClient.request(
        method: 'POST',
        url: Endpoints.forgotPasswordUrl,
        body: forgotData,
        decoder: (data) {
          return ResponseMessageModel.fromJson(data);
        });
    return response;
  }
}
