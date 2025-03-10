// TODO: mover para o pacote de navegacao
class RoutePath {
  String? prefix;
  String route;

  RoutePath({required this.route, this.prefix});

  String get fullPath => (prefix ?? '') + route;

  String get path => route;
}

abstract class AuthModuleRoutes {
  static RoutePath get createUser =>
      RoutePath(route: '/create-user', prefix: '/auth');
}
