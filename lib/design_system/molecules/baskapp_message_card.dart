import 'package:baskapp/design_system/atoms/baskapp_colors.dart';
import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:baskapp/design_system/atoms/baskapp_sizes.dart';
import 'package:flutter/material.dart';

class BaskappMessageCard extends StatelessWidget {
  final String message;
  final Color _backgroundColor;
  final Color _textColor;
  final Color _borderColor;
  final GestureTapCallback? onTapClose;

  const BaskappMessageCard(this.message, {super.key, this.onTapClose})
    : _backgroundColor = BaskappColors.primary,
      _textColor = BaskappColors.lightGrey,
      _borderColor = BaskappColors.primary;

  const BaskappMessageCard.warning(this.message, {super.key, this.onTapClose})
    : _backgroundColor = BaskappColors.warning,
      _textColor = BaskappColors.lightGrey,
      _borderColor = BaskappColors.warning;

  const BaskappMessageCard.error(this.message, {super.key, this.onTapClose})
    : _backgroundColor = BaskappColors.error,
      _textColor = BaskappColors.lightGrey,
      _borderColor = BaskappColors.error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: BaskappSizes.common,
        vertical: BaskappSizes.small,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _backgroundColor.withValues(alpha: .7),
        border: Border.all(color: _borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaskappText.bodyLarge(message, color: _textColor),
          if (onTapClose != null)
            GestureDetector(
              onTap: onTapClose,
              child: Icon(Icons.close, color: _textColor),
            ),
        ],
      ),
    );
  }
}
