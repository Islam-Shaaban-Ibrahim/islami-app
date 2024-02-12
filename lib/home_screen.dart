import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: tabs[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyAppTheme.primaryLightColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/quran_icon.png')),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage('assets/images/hadeth_icon.png')),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/images/radio_icon.png')),
                      label: 'Radio'),
                ]),
          ),
        ),
      ],
    );
  }
}
