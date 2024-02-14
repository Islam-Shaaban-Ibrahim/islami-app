import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/quran/sura_details_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyAppTheme.lightMode,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
