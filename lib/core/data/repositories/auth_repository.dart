import 'package:baskapp/core/data/models/dtos/do_login_dto.dart';
import 'package:baskapp/core/statics/api_routes.dart';

import '../models/auth_model.dart';
import '../services/http_service.dart';

class AuthRepository {
  final HttpService service;

  const AuthRepository({required this.service});

  Future<AuthModel> doLogin(DoLoginDto dto) async {
    Map<String, dynamic> response = await service.post(
      ApiRoutes.login,
      data: dto.toJson,
    );

    return AuthModel.fromJson(response['data']);
  }
}
