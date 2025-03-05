import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:baskapp/design_system/core/baskapp_sizes.dart';
import 'package:flutter/material.dart';

class BaskappInputText extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final bool? disabled;

  const BaskappInputText({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: disabled ?? true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BaskappSizes.small),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        hintText: hintText,
        label: label != null ? BaskappText.bodyMedium(label!) : null,
      ),
    );
  }
}
