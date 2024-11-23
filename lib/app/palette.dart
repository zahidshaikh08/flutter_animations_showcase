import 'package:flutter/material.dart';

abstract class Palette {
  static const colorPrimary = Color(0xffBD0D2C);
  static const whiteColor = Color(0xffFFFFFF);
  static const lightGreenColor = Color(0xff3D877C);
  static const blueColor = Color(0xff3E4E78);
  static const blackColor = Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
  );
}
