enum Position {
  pointGuard,
  shootingGuard,
  smallForward,
  powerForward,
  center;

  String get displayName {
    switch (this) {
      case Position.pointGuard:
        return 'Armador';
      case Position.shootingGuard:
        return 'Ala-armador';
      case Position.smallForward:
        return 'Ala';
      case Position.powerForward:
        return 'Ala-pivo';
      case Position.center:
        return 'Pivo';
    }
  }
}

extension PositionExtension on Position {
  static Position fromJson(String value) {
    return Position.values.firstWhere(
      (e) => e.name.toUpperCase() == value.replaceAll('_', '').toUpperCase(),
      orElse: () => throw ArgumentError('Status inválido: $value'),
    );
  }
}
