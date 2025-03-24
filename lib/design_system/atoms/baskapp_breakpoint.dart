import 'package:flutter/material.dart';

abstract class _Breakpoints {
  static int get cellphone => 600;

  static int get smallTable => 905;

  static int get tablets => 1240;

  static int get desktop => 1440;
}

class BaskappBreakpoint extends StatelessWidget {
  final Widget? cellphone;
  final Widget? smallTable;
  final Widget? tablets;
  final Widget? desktop;

  const BaskappBreakpoint({
    super.key,
    this.cellphone,
    this.smallTable,
    this.tablets,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= _Breakpoints.desktop && desktop != null) {
      return desktop!;
    } else if (width >= _Breakpoints.tablets && tablets != null) {
      return tablets!;
    } else if (width >= _Breakpoints.smallTable && smallTable != null) {
      return smallTable!;
    } else if (cellphone != null) {
      return cellphone!;
    } else if (smallTable != null) {
      return smallTable!;
    } else if (tablets != null) {
      return tablets!;
    } else if (desktop != null) {
      return desktop!;
    }

    return const SizedBox.shrink();
  }
}
