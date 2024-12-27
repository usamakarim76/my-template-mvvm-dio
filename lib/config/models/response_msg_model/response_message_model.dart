import 'package:json_annotation/json_annotation.dart';

part 'response_message_model.g.dart';

@JsonSerializable()
class ResponseMessageModel {
  final String message;

  ResponseMessageModel({
    required this.message,
  });
  factory ResponseMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageModelFromJson(json);
}
