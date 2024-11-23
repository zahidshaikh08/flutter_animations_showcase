import 'package:flutter/material.dart';
import 'package:test_christmas/app/palette.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isLight => Theme.of(this).brightness == Brightness.light;

  bool get isDark => !isLight;

  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => theme.primaryColor;

  TextStyle? get label18ItalicBoldMedium => theme.textTheme.labelMedium?.copyWith(
        color: Palette.lightGreenColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  TextStyle? get label18BoldMedium => theme.textTheme.labelMedium?.copyWith(
        color: Palette.blueColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle? get labelLarge => theme.textTheme.labelLarge;

  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}
