import 'package:baskapp/design_system/design_system.dart';
import 'package:baskapp/modules/home/states/teams_state.dart';
import 'package:baskapp/modules/home/view_models/home_view_model.dart';
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
                      child: ListView.builder(
                        itemCount: state.teams.length,
                        itemBuilder:
                            (_, index) => InkWell(
                              onTap:
                                  () => setState(() {
                                    _selectedTeam = state.teams[index].id;
                                  }),
                              child: Container(
                                color:
                                    state.teams[index].id == _selectedTeam
                                        ? BaskappColors.white
                                        : Colors.transparent,
                                child: ListTile(
                                  leading: BaskappAvatar(
                                    name: state.teams[index].name ?? 'Sem nome',
                                  ),
                                  title: BaskappText.titleMedium(
                                    state.teams[index].name ?? 'Sem nome',
                                  ),
                                  subtitle: BaskappText.bodyMedium(
                                    state.teams[index].players?.length
                                            .toString() ??
                                        '0',
                                  ),
                                ),
                              ),
                            ),
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
                          ? GridView.count(
                            crossAxisCount: 4,
                            children:
                                state.teams
                                        .firstWhere(
                                          (team) => team.id == _selectedTeam,
                                        )
                                        .players!
                                        .map(
                                          (player) => Card(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                BaskappAvatar(
                                                  name: player.name!,
                                                ),
                                                BaskappText.titleLarge(
                                                  player.name!,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList()
                                    as List<Widget>,
                          )
                          : SizedBox(),
                ),
              ),
            ],
          );
        }

        return SizedBox();
      },
    );
  }
}
