import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadethScreen';
  List<Color> colors = [Colors.white, Colors.grey];
  List<Color> colors_dark = [const Color(0xff0F1424), const Color(0xff0F1424)];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    Hadeth hadethArgs = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        Image.asset(
          settingProvider.isDark()
              ? "assets/images/background_dark.png"
              : "assets/images/main_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              hadethArgs.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: settingProvider.isDark() ? colors_dark : colors,
                ),
                borderRadius: BorderRadius.circular(25),
                color: MyAppTheme.white),
            child: ListView.builder(
              itemCount: hadethArgs.content.length,
              itemBuilder: (context, index) => Text(
                hadethArgs.content[index],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: settingProvider.isDark()
                          ? MyAppTheme.yellowColor
                          : MyAppTheme.blackColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
