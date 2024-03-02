import 'package:flutter/material.dart';

class MyAppTheme {
  static Color primaryLightColor = Color(0xffB7935F);
  static Color primaryDarkColor = Color(0xff0F1424);
  static Color blackColor = Colors.black;
  static Color yellowColor = Color(0xffFACC1D);
  static Color white = Color(0xFFF8F8F8);
  static Color sebhaCounterColor = Color(0xffC8B396);
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
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: blackColor, // hadeth name
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLightColor,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: white),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white, // appBar text
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: white, // sura names and ayat titles
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: white, // sura names and ayat
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: blackColor, // sura content
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: white, // hadeth name
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLightColor,
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
    ),
  );
}
