abstract class ValidatorsUtil {
  static String? validateNoEmpty(String? value) {
    if (value == null || value.isEmpty) return 'Esse campo é obrigatório';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email é obrigatório';

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (regex.hasMatch(value)) return null;
    return 'Formato de email inválido';
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) return 'Nome completo é obrigatório';

    String trimmedValue = value.trim();
    if (trimmedValue.split(' ').length <= 1) return 'Preencha com nome e sobrenome';

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Senha é obrigatório';

    String noWhiteSpacesValue = value.replaceAll(' ', '');
    if (noWhiteSpacesValue != value) return 'A senha não pode conter espaços em branco';

    if (value.length < 4) return 'A senha deve conter pelo menos 4 caracteres';

    return null;
  }
}