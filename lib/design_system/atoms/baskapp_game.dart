import '../design_system.dart';

class BaskappGame {
  String gameId;
  String teamName;
  String rivalName;
  int teamPoints;
  int rivalPoints;
  List<BaskappPlayer> players;

  BaskappGame({
    required this.gameId,
    required this.teamName,
    required this.rivalName,
    required this.teamPoints,
    required this.rivalPoints,
    required this.players,
  });
}