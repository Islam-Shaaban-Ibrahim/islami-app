import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/loading_indicator.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:islami_app/quran/item_sura_name.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<Color> colors = [Colors.white, Colors.grey];
  List<Color> colors_dark = [const Color(0xff0F1424), const Color(0xff0F1424)];
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
              args.suraName,
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
            child: verses.isEmpty
                ? LoadingIndicator()
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: verses.length,
                    itemBuilder: (context, index) => Text(
                      "${verses[index]}(${index + 1})",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: settingProvider.isDark()
                                ? MyAppTheme.yellowColor
                                : MyAppTheme.blackColor,
                          ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
          ),
        )
      ],
    );
  }

  Future<void> loadFile(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = suraContent.split('\n');
    verses = lines;
    setState(() {});
  }
}
