import 'package:flutter/material.dart';

import '../design_system.dart';

class BaskappGamesTable extends StatelessWidget {
  final List<BaskappGame> games;

  const BaskappGamesTable({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: BaskappSizes.common,
          children: [
            Icon(Icons.mood_bad_outlined, size: 120, color: BaskappColors.grey),
            BaskappText.titleLarge(
              'Sem jogos registrados',
              color: BaskappColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: games.length,
      itemBuilder:
          (_, indexGame) => Container(
            color:
                indexGame % 2 == 0 ? Colors.transparent : BaskappColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: BaskappSizes.medium,
              vertical: BaskappSizes.small,
            ),
            width: double.infinity,
            height: 80,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BaskappText.bodyMedium(
                          games[indexGame].teamName,
                          color: BaskappColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                        BaskappText.bodyMedium(
                          games[indexGame].teamPoints.toString(),
                          color: BaskappColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BaskappText.bodyMedium(
                          games[indexGame].rivalName,
                          fontWeight: FontWeight.bold,
                        ),
                        BaskappText.bodyMedium(
                          games[indexGame].rivalPoints.toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: BaskappSizes.large),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: games[indexGame].players.length,
                    itemBuilder:
                        (_, indexPlayer) => BaskappPlayerTile(
                          name: games[indexGame].players[indexPlayer].name,
                          number:
                              games[indexGame].players[indexPlayer].number
                                  .toString(),
                          points:
                              games[indexGame].players[indexPlayer].points
                                  ?.toString() ??
                              '0',
                        ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
