import 'package:baskapp/design_system/design_system.dart';
import 'package:baskapp/design_system/organisms/baskapp_games_table.dart';
import 'package:flutter/material.dart';

class GamesArea extends StatelessWidget {
  GamesArea({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: BaskappSizes.medium),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: BaskappSizes.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 350,
                child: BaskappInputText(
                  controller: _searchController,
                  hintText: 'Pesquise pelo jogo',
                ),
              ),
              Flexible(child: BaskappButton('Novo jogo', onPressed: () {})),
            ],
          ),
        ),
        SizedBox(height: BaskappSizes.medium),
        Expanded(
          child: BaskappGamesTable(
            games: [
              BaskappGame(
                gameId: 'ASDADASD',
                teamName: 'Lakers',
                rivalName: 'Celtics',
                teamPoints: 113,
                rivalPoints: 100,
                players: [
                  BaskappPlayer(name: 'Yago Taveiros', number: 12, points: 22),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
