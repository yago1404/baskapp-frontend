import 'package:baskapp/design_system/design_system.dart';
import 'package:baskapp/modules/home/states/teams_state.dart';
import 'package:baskapp/modules/home/view_models/home_view_model.dart';
import 'package:baskapp/modules/home/widgets/players_grid.dart';
import 'package:baskapp/modules/home/widgets/teams_list.dart';
import 'package:flutter/material.dart';

class TeamsArea extends StatefulWidget {
  final HomeViewModel viewModel;

  const TeamsArea({super.key, required this.viewModel});

  @override
  State<TeamsArea> createState() => _TeamsAreaState();
}

class _TeamsAreaState extends State<TeamsArea> {
  final _searchController = TextEditingController();
  String? _selectedTeam;

  @override
  void initState() {
    widget.viewModel.getMyTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel.teamsState,
      builder: (_, state, __) {
        if (state is LoadingTeams) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ErrorToLoadTeams) {
          return Center(
            child: BaskappText.titleLarge(
              state.message,
              color: BaskappColors.error,
            ),
          );
        }

        if (state is LoadedTeams) {
          if (state.teams.isEmpty) {
            return Center(
              child: BaskappButton('Crie seu primeiro time', onPressed: () {}),
            );
          }

          return Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: BaskappSizes.medium,
                        horizontal: BaskappSizes.small,
                      ),
                      child: BaskappInputText(
                        controller: _searchController,
                        label: 'Pesquise pelo time',
                      ),
                    ),
                    Expanded(
                      child: TeamsList(
                        teams: state.teams,
                        selectedIndex: _selectedTeam,
                        onTap:
                            (int index) => setState(() {
                              _selectedTeam = state.teams[index].id;
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: BaskappColors.white,
                  child:
                      _selectedTeam != null
                          ? PlayersGrid(
                            team: state.teams.firstWhere(
                              (team) => team.id == _selectedTeam,
                            ),
                          )
                          : _unselectedTeamMessage(),
                ),
              ),
            ],
          );
        }

        return SizedBox();
      },
    );
  }

  _unselectedTeamMessage() {
    return Container(
      color: BaskappColors.lightGrey,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: BaskappSizes.small,
          children: [
            Icon(
              Icons.people_alt_outlined,
              size: 32,
              color: BaskappColors.grey,
            ),
            BaskappText.titleLarge(
              'Selecione um time',
              color: BaskappColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
