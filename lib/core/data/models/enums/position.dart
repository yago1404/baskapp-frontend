enum Position { pointGuard, shootingGuard, smallForward, powerForward, center }

extension PositionExtension on Position {
  static Position fromJson(String value) {
    return Position.values.firstWhere(
      (e) => e.name.toUpperCase() == value.replaceAll('_', '').toUpperCase(),
      orElse: () => throw ArgumentError('Status inválido: $value'),
    );
  }
}
