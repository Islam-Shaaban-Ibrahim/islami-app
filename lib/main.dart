import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:islami_app/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      theme: MyAppTheme.lightMode,
      darkTheme: MyAppTheme.darkMode,
      themeMode: settingProvider.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.appLanguage),
    );
  }
}
