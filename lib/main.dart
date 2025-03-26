import 'package:baskapp/core/data/services/http_service.dart';
import 'package:baskapp/core/data/storage/app_store.dart';
import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/core/statics/app_texts.dart';
import 'package:baskapp/initial_binds.dart';
import 'package:baskapp/modules/auth/auth_module.dart';
import 'package:baskapp/modules/home/home_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import 'core/data/repositories/auth_repository.dart';
import 'core/data/repositories/profile_repository.dart';
import 'design_system/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialModule(
      initialBinds: initialBinds,
      modules: [AuthModule(), HomeModule()],
      materialApp: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppTexts.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: BaskappColors.primary),
          scaffoldBackgroundColor: BaskappColors.lightGrey,
          appBarTheme: AppBarTheme(backgroundColor: BaskappColors.lightGrey),
        ),
        initialRoute: AppRoutes.auth,
      ),
    );
  }
}
