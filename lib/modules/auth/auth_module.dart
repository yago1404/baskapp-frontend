import 'package:baskapp/core/data/repositories/auth_repository.dart';
import 'package:baskapp/core/data/repositories/profile_repository.dart';
import 'package:baskapp/core/data/services/http_service.dart';
import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/auth/auth_modules_route.dart';
import 'package:baskapp/modules/auth/pages/create_user.dart';
import 'package:baskapp/modules/auth/view_models/create_profile_view_model.dart';
import 'package:baskapp/modules/auth/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import 'pages/login_page.dart';

class AuthModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => LoginPage(viewModel: context.get<LoginViewModel>());

  @override
  List<Bind> get moduleBinds => [
    Bind<AuthRepository>(
      (context) => AuthRepository(service: context.get<HttpService>()),
    ),
    Bind<ProfileRepository>(
      (context) => ProfileRepository(service: context.get<HttpService>()),
    ),
    Bind<LoginViewModel>(
      (context) => LoginViewModel(repository: context.get<AuthRepository>()),
    ),
    Bind<CreateProfileViewModel>(
      (context) =>
          CreateProfileViewModel(repository: context.get<ProfileRepository>()),
    ),
  ];

  @override
  String get moduleRoute => AppRoutes.auth;

  @override
  Map<String, dynamic> get routes => {
    AuthModuleRoutes.createUser.path:
        (BuildContext context) =>
            CreateUserPage(viewModel: context.get<CreateProfileViewModel>()),
  };
}
