import 'package:flutter/material.dart';

class AppTextStyles {
  static const String aeonikFontFamily = 'Aeonik';

  static TextStyle? display1(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 20, fontFamily: aeonikFontFamily, color: Colors.white);
  }

  static TextStyle? display2(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 10, fontFamily: aeonikFontFamily, color: Colors.white);
  }

  static TextStyle? display3(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white);
  }

  static TextStyle? display4(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 15, color: color ?? Colors.white);
  }

  static TextStyle? display5(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 12, color: Colors.white.withOpacity(0.44));
  }

  static TextStyle? display6(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.44));
  }

  static TextStyle? display7(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);
  }

  static TextStyle? display8(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 14, color: color ?? Colors.white);
  }

  static TextStyle? display9(BuildContext context, {Color? color}) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
        fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black);
  }

  static TextStyle? display10(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 12, color: Colors.white);
  }

  static TextStyle? display11(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(fontSize: 14, color: Colors.black);
  }
}
