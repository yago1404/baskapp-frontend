import '../models/auth_model.dart';
import '../services/http_service.dart';

class AuthRepository {
  final HttpService service;

  const AuthRepository({required this.service});

  Future<AuthModel> doLogin({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> response = await service.post(
      '/user/login',
      data: {'email': email, 'password': password},
    );

    return AuthModel.fromJson(response['data']);
  }
}
