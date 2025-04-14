import 'package:baskapp/core/data/models/profile.dart';
import 'package:baskapp/core/data/models/team.dart';
import 'package:flutter/material.dart';

class AppStore {
  final ValueNotifier<Profile?> _profile = ValueNotifier(null);
  final ValueNotifier<List<Team>> _teams = ValueNotifier([]);

  set profile(Profile? profile) => _profile.value = profile;
  set teams(List<Team> team) => _teams.value = team;

  Profile? get profile => _profile.value;
  List<Team> get teams => _teams.value;
}