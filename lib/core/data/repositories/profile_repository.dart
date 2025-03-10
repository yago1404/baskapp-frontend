import 'package:baskapp/core/data/services/http_service.dart';

import '../models/profile.dart';

class ProfileRepository {
  final HttpService service;

  ProfileRepository({required this.service});

  Future<Profile> getProfile() async {
    Map<String, dynamic> response = await service.get('/profile');

    return Profile.fromJson(response['data']);
  }
}