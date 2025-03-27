import 'package:baskapp/core/data/models/profile.dart';
import 'package:flutter/material.dart';

class AppStore {
  final ValueNotifier<Profile?> _profile = ValueNotifier(null);

  set setProfile(Profile profile) => _profile.value = profile;

  Profile? get getProfile => _profile.value;
}