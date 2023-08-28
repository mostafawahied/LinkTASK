import 'package:dio/dio.dart';

abstract class AbstractNetworkService {
  late CancelToken cancelToken;
  Future<dynamic> get(url, {headers, query});
  Future<dynamic> post(url, {body, headers, query});
  Future<dynamic> delete(url, {body, headers, query});
  Future<dynamic> put(url, {body, headers, query});
  String generateURLWithParams(Map<String, dynamic>? params, String api);
  String concatenateParams(Map<String, dynamic>? params, String api);
}
