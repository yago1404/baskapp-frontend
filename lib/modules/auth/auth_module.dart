import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/auth/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import 'pages/login_page.dart';

class AuthModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => LoginPage(viewModel: context.get<LoginViewModel>());

  @override
  List<Bind> get moduleBinds => [Bind<LoginViewModel>((_) => LoginViewModel())];

  @override
  String get moduleRoute => AppRoutes.auth;

  @override
  Map<String, dynamic> get routes => {};
}
