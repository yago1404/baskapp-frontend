abstract class ValidatorsUtil {
  static String? validateNoEmpty(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) return 'Esse campo é obrigatório';
    return null;
  }

  static String? validateEmail(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) return 'Email é obrigatório';

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (regex.hasMatch(value)) return null;
    return 'Formato de email inválido';
  }

  static String? validateFullName(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) return 'Nome completo é obrigatório';

    String trimmedValue = value.trim();
    if (trimmedValue.split(' ').length <= 1) return 'Preencha com nome e sobrenome';

    return null;
  }

  static String? validatePassword(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) return 'Senha é obrigatório';

    String noWhiteSpacesValue = value.replaceAll(' ', '');
    if (noWhiteSpacesValue != value) return 'A senha não pode conter espaços em branco';

    if (value.length < 4) return 'A senha deve conter pelo menos 4 caracteres';

    return null;
  }

  static String? validateBirthday(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) {
      if (optional ?? false) return null;
      return 'Aniversário é obrigatório';
    }

    List<String> dates = value.split('/');

    if (dates.length < 3) {
      return 'Preencha data com dia/mês/ano';
    }

    String day = dates[0];
    String month = dates[1];
    String year = dates[2];

    if (day.length != 2 && month.length != 2 && year.length != 4) {
      return 'Formato de data inválido';
    }

    DateTime date = DateTime.parse('$year-$month-$day');

    if (date.isAfter(DateTime.now())) {
      return 'Data de aniversário deve ser no passado';
    }

    return null;
  }

  static String? validateHeight(String? value, [bool? optional]) {
    if (value == null || value.isEmpty) {
      if (optional ?? false) return null;
      return 'Altura é obrigatório';
    }

    if (!value.contains(',')) return 'A altura deve ser composta por virgula';

    List<String> height = value.trim().split(',');

    if (height[0].length != 1 || height[1].length > 2) return 'A altura deve ser composta por metros e centimetros';

    if (!RegExp(r'^[0-2]$').hasMatch(height[0])) return 'A unidade de metros deve ser entre 0 e 2';
    if (!RegExp(r'^[0-99]$').hasMatch(height[0])) return 'A unidade de centimetros deve ser entre 0 e 99';

    return null;
  }
}