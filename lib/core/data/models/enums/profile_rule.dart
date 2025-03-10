enum ProfileRule { coach, player, admin }

extension ProfileRuleExtension on ProfileRule {
  static ProfileRule fromJson(String value) {
    return ProfileRule.values.firstWhere(
          (e) => e.name.toUpperCase() == value.replaceAll('_', '').toUpperCase(),
      orElse: () => throw ArgumentError('Status inválido: $value'),
    );
  }
}
