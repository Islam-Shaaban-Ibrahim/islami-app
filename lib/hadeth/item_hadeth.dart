import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura_details_screen.dart';

class ItemHadeth extends StatelessWidget {
  String item;
  int index;
  ItemHadeth({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        textAlign: TextAlign.center,
        item,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
