import 'package:baskapp/design_system/design_system.dart';
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
          child: ListView.builder(
            itemCount: 200,
            itemBuilder:
                (_, index) => Container(
                  color:
                      index % 2 == 0 ? Colors.transparent : BaskappColors.white,
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
                                'Lakers - ',
                                color: BaskappColors.error,
                                fontWeight: FontWeight.bold,
                              ),
                              BaskappText.bodyMedium(
                                '87',
                                color: BaskappColors.error,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BaskappText.bodyMedium(
                                'Celtics - ',
                                fontWeight: FontWeight.bold,
                              ),
                              BaskappText.bodyMedium(
                                '73',
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
                          itemCount: 1000,
                          itemBuilder:
                              (_, index) => BaskappPlayerTile(
                                name: 'Yago Taveiros Ferreira',
                                number: '24',
                                points: '31',
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
