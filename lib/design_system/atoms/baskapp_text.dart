import 'package:flutter/material.dart';

class BaskappText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final List<Shadow>? shadows;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const BaskappText._(
    this.text, {
    required this.style,
    this.color,
    this.shadows,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  static Widget displayLarge(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 57, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget displayMedium(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 45, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget displaySmall(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 36, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget headlineLarge(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 32, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget headlineMedium(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 28, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget headlineSmall(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 24, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget titleLarge(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 22, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget titleMedium(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 16, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget titleSmall(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 14, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget bodyLarge(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 16, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget bodyMedium(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 14, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget bodySmall(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 12, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget labelLarge(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 14, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget labelMedium(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 12, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  static Widget labelSmall(
    String text, {
    Color? color,
    List<Shadow>? shadows,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    FontWeight? fontWeight,
  }) => BaskappText._(
    text,
    style: const TextStyle().copyWith(fontSize: 11, fontWeight: fontWeight),
    color: color,
    shadows: shadows,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(color: color, shadows: shadows),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
