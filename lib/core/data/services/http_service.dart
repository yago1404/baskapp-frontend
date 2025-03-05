import 'package:dio/dio.dart';

import '../models/errors/rest_client_error.dart';
import 'interceptors/auth_interceptor.dart';

class HttpService {
  late final Dio _dio;
  final String _baseUrl = "http://10.0.2.2:3000";

  HttpService({required Dio dio}) {
    _dio = dio;
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
        _baseUrl + path,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data["data"]["message"],
        data: e.response?.data["data"],
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
        _baseUrl + path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data["data"]["message"],
        data: e.response?.data["data"],
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
        _baseUrl + path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data["data"]["message"],
        data: e.response?.data["data"],
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
        _baseUrl + path,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      throw RestClientError(
        statusCode: e.response!.statusCode!,
        message: e.response?.data["data"]["message"],
        data: e.response?.data["data"],
      );
    }
  }
}