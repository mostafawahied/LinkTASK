import 'package:get/get.dart';

class ApiRequestFailure {
  String? error;
  final String? status;

  ApiRequestFailure({this.error, this.status});

  ApiRequestFailure copyWith({String? status, String? error}) =>
      ApiRequestFailure(
        status: status ?? this.status,
        error: error ?? this.error,
      );

  factory ApiRequestFailure.fromJson(Map<String, dynamic> json) {
    return ApiRequestFailure(
      status: json["status"],
      error: json["error"] ?? "somethingWentWrong".tr,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
      };

  @override
  String toString() {
    return "error: $error";
  }
}
