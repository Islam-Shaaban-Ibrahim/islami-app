import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryLightColor = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: blackColor, // appBar text
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLightColor,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
