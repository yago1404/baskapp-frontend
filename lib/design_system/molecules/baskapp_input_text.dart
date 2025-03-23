import 'package:baskapp/design_system/atoms/baskapp_input_mask.dart';
import 'package:baskapp/design_system/atoms/baskapp_text.dart';
import 'package:baskapp/design_system/core/baskapp_sizes.dart';
import 'package:flutter/material.dart';

class BaskappInputText extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final bool? disabled;
  final bool? hide;
  final Widget? trailingIcon;
  final FormFieldValidator<String>? validator;
  final List<BaskappInputMask> masks;

  const BaskappInputText({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.disabled,
    this.hide,
    this.trailingIcon,
    this.validator,
    this.masks = const [],
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: masks.map((e) => e.asInputFormatter).toList(),
      enabled: disabled ?? true,
      obscureText: hide ?? false,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BaskappSizes.small),
        ),
        suffixIcon: trailingIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        hintText: hintText,
        label: label != null ? BaskappText.bodyMedium(label!) : null,
      ),
    );
  }
}
