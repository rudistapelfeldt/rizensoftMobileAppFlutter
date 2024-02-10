import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class BaseResponse {
  late String? errorCode;
  late String? error;
  late bool success;

  BaseResponse({this.errorCode, this.error, required this.success});

  BaseResponse.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        error = json['error'],
        success = json['success'] ?? false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['error'] = error;
    data['success'] = success;
    return data;
  }
}