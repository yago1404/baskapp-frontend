import 'package:baskapp/core/data/models/enums/profile_rule.dart';

import 'enums/position.dart';

class Profile {
  String? id;
  String? name;
  String? cellphone;
  DateTime? birthday;
  int? height;
  Position? position;
  ProfileRule? rule;
  String? picture;
  bool? open;

  Profile(
      {this.id,
        this.name,
        this.cellphone,
        this.birthday,
        this.height,
        this.position,
        this.rule,
        this.picture,
        this.open});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cellphone = json['cellphone'];
    birthday = DateTime.parse(json['birthday']);
    height = json['height'];
    position = json['position'] != null ? PositionExtension.fromJson(json['position']) : null;
    rule = json['rule'] != null ? ProfileRuleExtension.fromJson(json['profile']) : null;
    picture = json['picture'];
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cellphone'] = cellphone;
    data['birthday'] = birthday;
    data['height'] = height;
    data['position'] = position;
    data['rule'] = rule;
    data['picture'] = picture;
    data['open'] = open;
    return data;
  }
}