import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

class HomeModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage => (_) => HomePage();

  @override
  List<Bind> get moduleBinds => [];

  @override
  String get moduleRoute => AppRoutes.home;

  @override
  Map<String, dynamic> get routes => {};
}