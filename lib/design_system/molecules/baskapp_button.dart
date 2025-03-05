import 'package:baskapp/design_system/design_system.dart';
import 'package:flutter/material.dart';

class BaskappButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;
  final bool expanded;
  final Color _backgroundColor;
  final Color _fontColor;

  const BaskappButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.disabled = false,
    this.expanded = false,
  }) : _backgroundColor = BaskappColors.primary,
       _fontColor = BaskappColors.white;

  const BaskappButton.secondary(
    this.text, {
    super.key,
    required this.onPressed,
    this.disabled = false,
    this.expanded = false,
  }) : _backgroundColor = Colors.transparent,
       _fontColor = BaskappColors.primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(_backgroundColor),
          elevation: WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: BaskappSizes.common),
          ),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: BaskappColors.primary),
            ),
          ),
        ),
        child: BaskappText.bodyMedium(text, color: _fontColor),
      ),
    );
  }
}
