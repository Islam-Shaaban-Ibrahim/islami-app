import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/loading_indicator.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/hadeth/item_hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider/settings_provider_calss.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(children: [
      Image.asset("assets/images/hadeth_image.png"),
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, bottom: 5),
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
              color: settingProvider.isDark()
                  ? MyAppTheme.yellowColor
                  : MyAppTheme.primaryLightColor,
              width: 2.5),
          bottom: BorderSide(
              color: settingProvider.isDark()
                  ? MyAppTheme.yellowColor
                  : MyAppTheme.primaryLightColor,
              width: 2.5),
        )),
        child: Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Expanded(
        child: ahadeth.isEmpty
            ? LoadingIndicator()
            : ListView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HadethDetails.routeName,
                      arguments: ahadeth[index],
                    );
                  },
                  child: ItemHadeth(
                      item: "الحديث رقم  [${index + 1}]", index: index),
                ),
                itemCount: ahadeth.length,
              ),
      ),
    ]);
  }

  loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethStrings = ahadethContent.split('#\r\n');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;

      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth(this.title, this.content);
}
