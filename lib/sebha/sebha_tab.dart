import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider/settings_provider_calss.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turn = 0.0;
  int sebhaCounter = 0;

  List<String> tasbeeh = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional(.01, -2.4),
          children: [
            GestureDetector(
              onTap: () {
                countingTasbeeh();
              },
              child: Transform.rotate(
                angle: turn,
                child: Image.asset(
                  settingProvider.isDark()
                      ? "assets/images/sebha_dark.png"
                      : "assets/images/sebha_image.png",
                ),
              ),
            ),
            Image.asset(
              settingProvider.isDark()
                  ? "assets/images/sebha_headDark.png"
                  : "assets/images/sebha_head.png",
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            AppLocalizations.of(context)!.tasabeeh,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "$sebhaCounter",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
            ),
            width: 60,
            height: 80,
            decoration: BoxDecoration(
                color: settingProvider.isDark()
                    ? MyAppTheme.primaryDarkColor
                    : MyAppTheme.sebhaCounterColor,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Text(
            tasbeeh[index],
            style: TextStyle(
                color: settingProvider.isDark()
                    ? MyAppTheme.blackColor
                    : MyAppTheme.white),
          ),
          width: MediaQuery.of(context).size.width * 0.35,
          height: 50,
          decoration: BoxDecoration(
              color: settingProvider.isDark()
                  ? MyAppTheme.yellowColor
                  : MyAppTheme.primaryLightColor,
              borderRadius: BorderRadius.circular(30)),
        ),
      ],
    );
  }

  void countingTasbeeh() {
    if (sebhaCounter == 99) {
      sebhaCounter = -1;
      index = 0;
      turn = 0;
    }
    if (sebhaCounter % 33 == 0 && sebhaCounter != 0) {
      index++;
    }
    sebhaCounter++;
    turn += 1;
    setState(() {});
  }
}
