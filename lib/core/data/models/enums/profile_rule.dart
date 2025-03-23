enum ProfileRule {
  coach,
  player,
  admin;

  String get displayName {
    switch (this) {
      case ProfileRule.coach:
        return 'Treinador';
      case ProfileRule.player:
        return 'Jogador';
      case ProfileRule.admin:
        return 'Administrador';
    }
  }
}

extension ProfileRuleExtension on ProfileRule {
  static ProfileRule fromJson(String value) {
    return ProfileRule.values.firstWhere(
      (e) => e.name.toUpperCase() == value.replaceAll('_', '').toUpperCase(),
      orElse: () => throw ArgumentError('Status inválido: $value'),
    );
  }
}
