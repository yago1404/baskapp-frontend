import 'profile.dart';

class Team {
  String? id;
  String? name;
  List<Profile>? players;
  Profile? coach;

  Team({this.id, this.name, this.players, this.coach});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['players'] != null) {
      players = <Profile>[];
      json['players'].forEach((v) {
        players!.add(Profile.fromJson(v));
      });
    }
    coach = json['coach'] != null ? Profile.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    if (coach != null) {
      data['coach'] = coach!.toJson();
    }
    return data;
  }
}
