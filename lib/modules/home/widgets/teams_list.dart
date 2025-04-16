import 'package:baskapp/core/data/models/team.dart';
import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';

class TeamsList extends StatelessWidget {
  final List<Team> teams;
  final void Function(int index) onTap;
  final String? selectedIndex;

  const TeamsList({
    super.key,
    required this.teams,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () => onTap(index),
          child: Container(
            color:
                teams[index].id == selectedIndex
                    ? BaskappColors.white
                    : Colors.transparent,
            child: ListTile(
              leading: BaskappAvatar(name: teams[index].name ?? 'Sem nome'),
              title: BaskappText.titleMedium(teams[index].name ?? 'Sem nome'),
              subtitle: BaskappText.bodyMedium(
                teams[index].players?.length.toString() ?? '0',
              ),
            ),
          ),
        );
      },
    );
  }
}
