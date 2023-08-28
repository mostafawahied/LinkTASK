import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gett;

import 'abstract_network_service.dart';
import 'dio.dart';
import 'network_exceptions.dart';

class NetworkService extends gett.GetxService
    implements AbstractNetworkService {
  final networkService = gett.Get.find<AppDio>();

  @override
  CancelToken cancelToken = CancelToken();

  @override
  Future<dynamic> delete(url, {body, headers, query}) async {
    try {
      return await networkService.dio.delete(
        url,
        data: body,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      return NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<dynamic> get(url, {headers, query}) async {
    try {
      return await networkService.dio.get(
        url,
        queryParameters: query,
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      return NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<dynamic> post(url, {body, headers, query}) async {
    try {
      return await networkService.dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(
          followRedirects: false,
          headers: headers,
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      return NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<dynamic> put(url, {body, headers, query}) async {
    try {
      return await networkService.dio.put(
        url,
        data: body,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      return NetworkExceptions.getDioException(e);
    }
  }

  @override
  String generateURLWithParams(Map<String, dynamic>? params, String api) {
    api = (params != null && params.isNotEmpty) ? '$api?' : api;
    params!.forEach((key, val) {
      if (val != null) {
        api += "$key=${val.toString()}&";
      }
    });
    return api;
  }

  @override
  String concatenateParams(Map<String, dynamic>? params, String api) {
    api = (params != null && params.isNotEmpty) ? '$api/' : api;
    params!.forEach((key, val) {
      if (val != null) {
        api += '$val/';
      }
    });
    return api;
  }
}
