import 'package:baskapp/core/data/repositories/teams_repository.dart';
import 'package:module_navigator/module_navigator.dart';

import 'core/data/repositories/auth_repository.dart';
import 'core/data/repositories/profile_repository.dart';
import 'core/data/services/http_service.dart';
import 'core/data/storage/app_store.dart';

final List<Bind> initialBinds = [
  Bind<HttpService>((_) => HttpService()),
  Bind<AppStore>((_) => AppStore()),
  Bind<AuthRepository>(
    (context) => AuthRepository(service: context.get<HttpService>()),
  ),
  Bind<ProfileRepository>(
    (context) => ProfileRepository(service: context.get<HttpService>()),
  ),
  Bind<TeamsRepository>(
    (context) => TeamsRepository(service: context.get<HttpService>()),
  ),
];
