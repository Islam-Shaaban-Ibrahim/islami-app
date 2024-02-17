import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              settingProvider.changeTheme(ThemeMode.dark);
            },
            child: settingProvider.appTheme == ThemeMode.dark
                ? selectedLangWidget(AppLocalizations.of(context)!.dark)
                : unSelectedLnagWidget(AppLocalizations.of(context)!.dark),
          ),
          InkWell(
            onTap: () {
              settingProvider.changeTheme(ThemeMode.light);
            },
            child: settingProvider.appTheme == ThemeMode.light
                ? selectedLangWidget(AppLocalizations.of(context)!.light)
                : unSelectedLnagWidget(AppLocalizations.of(context)!.light),
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
            color: Provider.of<SettingProvider>(context).isDark()
                ? MyAppTheme.blackColor
                : MyAppTheme.blackColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
