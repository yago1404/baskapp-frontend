import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/home/pages/home_page.dart';
import 'package:baskapp/modules/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';


class HomeModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => HomePage(
        viewModel: context.get(),
      );

  @override
  List<Bind> get moduleBinds => [
    Bind<HomeViewModel>(
      (context) =>
          HomeViewModel(store: context.get(), teamsRepository: context.get()),
    ),
  ];

  @override
  String get moduleRoute => AppRoutes.home;

  @override
  Map<String, dynamic> get routes => {};
}
