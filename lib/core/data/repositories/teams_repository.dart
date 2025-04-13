import '../models/team.dart';
import '../services/http_service.dart';

class TeamsRepository {
  final HttpService service;

  const TeamsRepository({required this.service});

  Future<List<Team>> getMyTeams() async {
    Map<String, dynamic> response = await service.get('/team');

    List<Team> teams = [];

    for (var team in response['data']) {
      teams.add(Team.fromJson(team));
    }

    return teams;
  }
}