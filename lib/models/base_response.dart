abstract class BaseResponse {
  late String? errorCode;
  late String? error;
  late bool success;

  BaseResponse({this.errorCode, this.error, required this.success});
}