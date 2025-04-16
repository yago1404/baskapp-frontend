import 'package:baskapp/core/data/models/errors/rest_client_error.dart';
import 'package:baskapp/core/data/repositories/teams_repository.dart';
import 'package:baskapp/core/data/storage/app_store.dart';
import 'package:baskapp/modules/home/states/teams_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/data/models/team.dart';

class HomeViewModel {
  final AppStore store;
  final TeamsRepository teamsRepository;

  HomeViewModel({required this.store, required this.teamsRepository});

  final ValueNotifier<TeamsState> teamsState = ValueNotifier(
    LoadedTeams(teams: []),
  );

  String? get profileName => store.profile?.name;

  Future<void> getMyTeams() async {
    if (store.teams.isNotEmpty) {
      teamsState.value = LoadedTeams(teams: store.teams);
      return;
    }

    teamsState.value = LoadingTeams();
    await Future.delayed(Duration(seconds: 2));
    try {
      List<Team> teams = await teamsRepository.getMyTeams();
      store.teams = teams;

      teamsState.value = LoadedTeams(teams: teams);
    } on RestClientError catch (e) {
      if (e.statusCode == 404) {
        teamsState.value = LoadedTeams(teams: []);
        return;
      }

      teamsState.value = ErrorToLoadTeams(message: e.message);
    } catch (e) {
      teamsState.value = ErrorToLoadTeams(
        message: 'Erro desconhecido ao recuperar os times',
      );
    }
  }
}
