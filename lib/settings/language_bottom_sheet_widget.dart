import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              settingProvider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: settingProvider.appLanguage == 'en'
                ? selectedLangWidget(AppLocalizations.of(context)!.english)
                : unSelectedLnagWidget(AppLocalizations.of(context)!.english),
          ),
          InkWell(
            onTap: () {
              settingProvider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: settingProvider.appLanguage == 'ar'
                ? selectedLangWidget(AppLocalizations.of(context)!.arabic)
                : unSelectedLnagWidget(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selectedLangWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
      ],
    );
  }

  Widget unSelectedLnagWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Provider.of<SettingProvider>(context).isDark()
                ? MyAppTheme.yellowColor
                : MyAppTheme.blackColor,
          ),
    );
  }
}
