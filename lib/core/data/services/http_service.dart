import 'package:dio/dio.dart';

import '../models/errors/rest_client_error.dart';
import 'interceptors/auth_interceptor.dart';

class HttpService {
  late final Dio _dio;

  HttpService({required Dio dio}) {
    _dio = dio;
    _dio.options.baseUrl = 'http://10.0.2.2:3000';
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    ]);
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data['message'],
        data: e.response?.data,
      );
    }
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data['message'],
        data: e.response?.data,
      );
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data['message'],
        data: e.response?.data,
      );
    }
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.delete(
        path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data['message'],
        data: e.response?.data,
      );
    }
  }
}
