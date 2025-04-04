import 'package:baskapp/design_system/atoms/baskapp_colors.dart';
import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:flutter/material.dart';

class BaskappAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const BaskappAvatar({super.key, required this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: BaskappColors.grey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child:
            imageUrl != null
                ? Image.network(imageUrl!)
                : BaskappText.titleLarge(
                  _getInitials(name),
                  fontWeight: FontWeight.bold,
                ),
      ),
    );
  }

  String _getInitials(String name) {
    List<String> names = name.trim().split(' ');

    if (names.length < 2) {
      return names[0][0];
    }

    return names[0][0] + names[1][0];
  }
}
