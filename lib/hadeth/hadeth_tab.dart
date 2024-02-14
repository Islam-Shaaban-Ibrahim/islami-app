import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/circular_progress_indicator.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/hadeth/item_hadeth.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(children: [
      Image.asset("assets/images/hadeth_image.png"),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.only(top: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
        )),
        child: Text(
          textAlign: TextAlign.center,
          "Hadeth",
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
                  child: ItemHadeth(item: ahadeth[index].title, index: index),
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
