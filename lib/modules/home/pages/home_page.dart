import 'package:baskapp/design_system/atoms/baskapp_colors.dart';
import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:baskapp/modules/home/view_models/home_view_model.dart';
import 'package:baskapp/modules/home/widgets/games_area.dart';
import 'package:baskapp/modules/home/widgets/teams_area.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BaskappColors.primary,
          title: BaskappText.titleLarge(
            'Olá, ${widget.viewModel.profileName}',
            color: BaskappColors.white,
          ),
          leading: Icon(Icons.menu, color: BaskappColors.white),
          bottom: TabBar(
            tabs: [
              BaskappText.bodyLarge('Jogos', color: BaskappColors.white),
              BaskappText.bodyLarge('Times', color: BaskappColors.white),
            ],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: BaskappColors.white, width: 3.0),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            GamesArea(),
            TeamsArea(viewModel: widget.viewModel),
          ],
        ),
      ),
    );
  }
}
