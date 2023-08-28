import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoggingInterceptor extends dio.Interceptor {
  final Dio originalDio;
  bool isRefreshing = false;

  LoggingInterceptor(Dio dio) : originalDio = dio;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('*** API Request - Start ***');
    printKV('URI', options.uri);
    printKV('METHOD', options.method);
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint('BODY:');
    printAll(options.data ?? "");
    logPrint('*** API Request - End ***');
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      dio.Response response, ResponseInterceptorHandler handler) async {
    logPrint('*** Api Response - Start ***');
    printKV('URI', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode != null);
    printKV('REDIRECT', response.isRedirect);
    logPrint('BODY:');
    printAll(response.data ?? "");
    logPrint('*** Api Response - End ***');

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    logPrint('*** Api Error - Start ***:');

    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
      printKV('REDIRECT', err.response?.realUri ?? "");
      logPrint('BODY:');
      printAll(err.response?.toString());
    }
    logPrint('*** Api Error - End ***:');
    return super.onError(err, handler);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}
