import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BaskappInputMask {
  final String mask;
  final Map<String, RegExp>? filter;

  BaskappInputMask({required this.mask, this.filter});

  MaskTextInputFormatter get asInputFormatter =>
      MaskTextInputFormatter(mask: mask, filter: filter);
}
