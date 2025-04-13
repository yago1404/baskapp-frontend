import '../../../core/data/models/team.dart';

interface class TeamsState {}

class LoadingTeams implements TeamsState {}

class LoadedTeams implements TeamsState {
  final List<Team> teams;

  LoadedTeams({required this.teams});
}

class ErrorToLoadTeams implements TeamsState {
  final String message;

  ErrorToLoadTeams({required this.message});
}
