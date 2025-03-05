interface class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class ErrorLoginState implements LoginState {
  final String message;

  ErrorLoginState(this.message);
}
