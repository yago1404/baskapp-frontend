import 'package:baskapp/core/statics/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import 'pages/login_page.dart';

class AuthModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage => (_) => LoginPage();

  @override
  List<Bind> get moduleBinds => [];

  @override
  String get moduleRoute => AppRoutes.auth;

  @override
  Map<String, dynamic> get routes => {};
}