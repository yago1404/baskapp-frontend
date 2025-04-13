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
  int? _selectedTeam;

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
          return Center(
            child: CircularProgressIndicator(),
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
                      itemCount: 4,
                      itemBuilder:
                          (_, index) => InkWell(
                            onTap:
                                () => setState(() {
                                  _selectedTeam = index;
                                }),
                            child: Container(
                              color:
                                  index == _selectedTeam
                                      ? BaskappColors.white
                                      : Colors.transparent,
                              child: ListTile(
                                leading: BaskappAvatar(name: 'Lakers'),
                                title: BaskappText.titleMedium('Lakers'),
                                subtitle: BaskappText.bodyMedium('12 atletas'),
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(flex: 3, child: Container(color: BaskappColors.white)),
          ],
        );
      }
    );
  }
}
