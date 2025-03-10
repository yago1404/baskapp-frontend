import 'package:baskapp/core/data/models/dtos/create_profile_dto.dart';
import 'package:baskapp/core/data/models/errors/rest_client_error.dart';
import 'package:baskapp/core/data/models/profile.dart';
import 'package:baskapp/core/data/repositories/profile_repository.dart';

class CreateProfileViewModel {
  final ProfileRepository _repository;

  CreateProfileViewModel({required ProfileRepository repository})
    : _repository = repository;

  Future<void> createProfile(CreateProfileDto dto) async {
    try {
      Profile result = await _repository.createProfile(dto);
    } on RestClientError catch (e) {
      // TODO
    }
  }
}
