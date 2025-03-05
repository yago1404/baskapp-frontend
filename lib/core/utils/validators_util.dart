abstract class ValidatorsUtil {
  static String? noEmptyValidator(String? value) {
    if (value == null || value.isEmpty) return 'Esse campo é obrigatório';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email é obrigatório';

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (regex.hasMatch(value)) return null;
    return 'Formato de email inválido';
  }
}