import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_device.png"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "إذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: settingProvider.isDark()
                      ? MyAppTheme.yellowColor
                      : MyAppTheme.primaryLightColor,
                  size: 50,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: settingProvider.isDark()
                      ? MyAppTheme.yellowColor
                      : MyAppTheme.primaryLightColor,
                  size: 50,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: settingProvider.isDark()
                      ? MyAppTheme.yellowColor
                      : MyAppTheme.primaryLightColor,
                  size: 50,
                )),
          ],
        )
      ],
    );
  }
}
