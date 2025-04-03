import 'package:baskapp/design_system/atoms/baskapp_colors.dart';
import 'package:baskapp/design_system/atoms/baskapp_sizes.dart';
import 'package:flutter/material.dart';

import '../atoms/baskapp_text.dart';

class BaskappDropdown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final ValueChanged<dynamic>? onChange;
  final String? hintText;

  const BaskappDropdown({
    super.key,
    required this.items,
    this.onChange,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: BaskappColors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: BaskappSizes.small),
      child: DropdownButton(
        items: items,
        onChanged: onChange,
        isExpanded: true,
        elevation: 0,
        hint: BaskappText.bodyLarge(hintText ?? 'Selecione um item'),
        underline: SizedBox(),
      ),
    );
  }
}
