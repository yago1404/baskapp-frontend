import 'package:baskapp/core/data/storage/app_store.dart';

class HomeViewModel {
  final AppStore store;

  HomeViewModel({required this.store});

  String? get profileName => store.getProfile?.name;
}