import 'package:baskapp/core/data/models/enums/position.dart';
import 'package:baskapp/core/data/models/enums/profile_rule.dart';

class CreateProfileDto {
  String name;
  String? cellphone;
  DateTime birthday;
  int? height;
  Position? position;
  ProfileRule rule;

  CreateProfileDto({
    required this.name,
    required this.birthday,
    required this.rule,
    this.cellphone,
    this.height,
    this.position,
  });

  Map<String, dynamic> get asJson => {
    "name": name,
    "cellphone": cellphone,
    "birthday": birthday,
    "height": height,
    "position": position,
    "rule": rule,
  };
}
