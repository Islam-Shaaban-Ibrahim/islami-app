import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryLightColor = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color white = Color(0xFFF8F8F8);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor, // appBar text
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: blackColor, // sura names and ayat titles
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: blackColor, // sura names and ayat
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: blackColor, // sura content
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLightColor,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
