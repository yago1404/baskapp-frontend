import 'package:flutter/material.dart';

import '../design_system.dart';

class BaskappPlayerTile extends StatelessWidget {
  final String number;
  final String name;
  final String points;

  const BaskappPlayerTile({
    super.key,
    required this.name,
    required this.number,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaskappText.titleMedium('#$number'),
        SizedBox(
          width: 200,
          child: ListTile(
            leading: BaskappAvatar(name: name),
            title: BaskappText.bodyMedium(
              name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: BaskappText.bodyLarge(points),
          ),
        ),
      ],
    );
  }
}
