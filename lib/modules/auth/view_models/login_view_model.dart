import 'package:flutter/material.dart';

import '../states/login_states.dart';

class LoginViewModel {
  final ValueNotifier loginState = ValueNotifier<LoginState>(InitialLoginState());

  Future doLogin({required String email, required  String password}) async {
    loginState.value = LoadingLoginState();
    await Future.delayed(Duration(seconds: 2));
    loginState.value = InitialLoginState();
  }
}