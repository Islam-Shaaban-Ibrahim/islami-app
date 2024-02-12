import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura_details_screen.dart';

class ItemSura extends StatelessWidget {
  String item;
  int index;
  ItemSura({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        textAlign: TextAlign.center,
        item,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;
  SuraDetailsArgs({required this.suraName, required this.index});
}
