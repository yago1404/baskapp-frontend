import 'package:baskapp/design_system/atoms/baskapp_colors.dart';
import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:flutter/material.dart';

class BaskappAvatar extends StatelessWidget {
  final String? imageUrl;
  final String initials;

  const BaskappAvatar({super.key, required this.initials, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: BaskappColors.grey,
        shape: BoxShape.circle,
      ),
      child: Center(child: BaskappText.titleLarge(initials)),
    );
  }
}
