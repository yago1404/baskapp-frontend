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
                  BaskappPlayer(name: 'Lebron James', number: 23, points: 32),
                  BaskappPlayer(name: 'Luka Doncic', number: 77, points: 37),
                  BaskappPlayer(name: 'Ruy Hashimura', number: 11, points: 19),
                  BaskappPlayer(name: 'Austin Reaves', number: 12, points: 20),
                  BaskappPlayer(name: 'Dalton Knetch', number: 13, points: 10),
                  BaskappPlayer(name: 'Jaxson Hayes', number: 14, points: 5),
                  BaskappPlayer(name: 'Jarred Vanderbitt', number: 15, points: 8),
                  BaskappPlayer(name: 'Alex Len', number: 16, points: 13),
                  BaskappPlayer(name: 'Trey Demisson', number: 17, points: 0),
                  BaskappPlayer(name: 'Bronny James', number: 18, points: 0),
                  BaskappPlayer(name: 'Shake Milton', number: 19, points: 0),
                ],
              ),
              BaskappGame(
                gameId: 'ASDADASD',
                teamName: 'Lakers',
                rivalName: 'Halks',
                teamPoints: 93,
                rivalPoints: 102,
                players: [
                  BaskappPlayer(name: 'Lebron James', number: 23, points: 32),
                  BaskappPlayer(name: 'Luka Doncic', number: 77, points: 37),
                  BaskappPlayer(name: 'Ruy Hashimura', number: 11, points: 19),
                  BaskappPlayer(name: 'Austin Reaves', number: 12, points: 20),
                  BaskappPlayer(name: 'Dalton Knetch', number: 13, points: 10),
                  BaskappPlayer(name: 'Jaxson Hayes', number: 14, points: 5),
                  BaskappPlayer(name: 'Jarred Vanderbitt', number: 15, points: 8),
                  BaskappPlayer(name: 'Alex Len', number: 16, points: 13),
                  BaskappPlayer(name: 'Trey Demisson', number: 17, points: 0),
                  BaskappPlayer(name: 'Bronny James', number: 18, points: 0),
                  BaskappPlayer(name: 'Shake Milton', number: 19, points: 0),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
