import 'package:baskapp/core/data/storage/app_disk_storage.dart';
import 'package:baskapp/core/statics/app_storage_keys.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await AppDiskStorage.instance.getItem<String?>(
      AppStorageKeys.authToken,
    );

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
