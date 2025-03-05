import 'package:baskapp/core/data/models/errors/rest_client_error.dart';
import 'package:baskapp/core/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/auth_model.dart';
import '../states/login_states.dart';

class LoginViewModel {
  final AuthRepository repository;

  LoginViewModel({required this.repository});

  final ValueNotifier loginState = ValueNotifier<LoginState>(InitialLoginState());

  Future doLogin({required String email, required  String password}) async {
    loginState.value = LoadingLoginState();
    try {
      AuthModel model = await repository.doLogin(email: email, password: password);
    } on RestClientError catch (e) {
      // TODO
    }
    loginState.value = InitialLoginState();
  }
}