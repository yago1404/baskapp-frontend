class DoLoginDto {
  final String email;
  final String password;

  DoLoginDto({required this.email, required this.password});

  Map<String, dynamic> get toJson => {
    'email': email,
    'password': password,
  };
}