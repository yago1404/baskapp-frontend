import 'package:baskapp/core/data/models/dtos/do_login_dto.dart';
import 'package:baskapp/core/data/models/errors/rest_client_error.dart';
import 'package:baskapp/core/data/models/profile.dart';
import 'package:baskapp/core/data/repositories/auth_repository.dart';
import 'package:baskapp/core/data/repositories/profile_repository.dart';
import 'package:baskapp/core/data/storage/app_disk_storage.dart';
import 'package:baskapp/core/statics/app_storage_keys.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/auth_model.dart';
import '../../../core/data/storage/app_store.dart';
import '../states/login_states.dart';

class LoginViewModel {
  final AuthRepository repository;
  final ProfileRepository profileRepository;
  final AppStore store;

  LoginViewModel({
    required this.repository,
    required this.profileRepository,
    required this.store,
  });

  final ValueNotifier loginState = ValueNotifier<LoginState>(
    InitialLoginState(),
  );

  Future doLogin({required DoLoginDto dto, required Function onSuccess}) async {
    loginState.value = LoadingLoginState();
    try {
      AuthModel model = await repository.doLogin(dto);

      AppDiskStorage.instance.setItem(AppStorageKeys.authToken, model.token);
      AppDiskStorage.instance.setItem(
        AppStorageKeys.refreshToken,
        model.refreshToken,
      );

      Profile profile = await profileRepository.getProfile();
      store.setProfile = profile;

      loginState.value = InitialLoginState();
      onSuccess();
    } on RestClientError catch (e) {
      loginState.value = ErrorLoginState(e.message);
    }
  }

  void clearState() {
    loginState.value = InitialLoginState();
  }
}
