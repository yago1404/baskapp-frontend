import 'package:baskapp/core/data/services/http_service.dart';

import '../models/dtos/create_profile_dto.dart';
import '../models/profile.dart';

class ProfileRepository {
  final HttpService service;

  ProfileRepository({required this.service});

  Future<Profile> getProfile() async {
    Map<String, dynamic> response = await service.get('/profile');

    return Profile.fromJson(response['data']);
  }

  Future<Profile> createProfile(CreateProfileDto dto) async {
    Map<String, dynamic> response = await service.post(
      '/profile',
      data: dto.asJson,
    );

    return Profile.fromJson(response['data']);
  }
}
