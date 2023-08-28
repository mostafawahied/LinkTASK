import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:link_task/globalServices/apiServices/networkService/refresh_interceptor.dart';

import '../../../utils/urls.dart';

class AppDio {
  Dio dio = Dio();

  AppDio() {
    interceptor();
  }

  void interceptor() {
    dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.add(RefreshInterceptor(dio));
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
