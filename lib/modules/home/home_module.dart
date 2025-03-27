import 'package:baskapp/core/statics/app_routes.dart';
import 'package:baskapp/modules/home/pages/home_page.dart';
import 'package:baskapp/modules/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import '../../core/data/storage/app_store.dart';

class HomeModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) =>
          HomePage(viewModel: HomeViewModel(store: context.get<AppStore>()));

  @override
  List<Bind> get moduleBinds => [];

  @override
  String get moduleRoute => AppRoutes.home;

  @override
  Map<String, dynamic> get routes => {};
}
