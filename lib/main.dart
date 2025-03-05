import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/auth/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialModule(
      modules: [
        AuthModule(),
      ],
      materialApp: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.auth,
      ),
    );
  }
}
