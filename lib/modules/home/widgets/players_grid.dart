import 'package:flutter/material.dart';

import '../../../core/data/models/team.dart';
import '../../../design_system/design_system.dart';

class PlayersGrid extends StatelessWidget {
  final Team team;

  const PlayersGrid({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children:
          team.players!
                  .map((player) => _PlayerCard(name: player.name ?? 'Sem Nome'))
                  .toList()
              as List<Widget>,
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final String name;

  const _PlayerCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: BaskappSizes.common,
        children: [
          BaskappAvatar(name: name),
          BaskappText.titleLarge(name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: BaskappSizes.small,
            children: [
              BaskappText.bodyMedium('PTS: 13'),
              BaskappText.bodyMedium('ASS: 4'),
              BaskappText.bodyMedium('BLK: 2'),
            ],
          ),
        ],
      ),
    );
  }
}
