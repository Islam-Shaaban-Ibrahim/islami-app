import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadethScreen';
  List<Color> colors = [Colors.white, Colors.grey];

  @override
  Widget build(BuildContext context) {
    Hadeth hadethArgs = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(25),
                color: MyAppTheme.white),
            child: ListView.builder(
              itemCount: hadethArgs.content.length,
              itemBuilder: (context, index) => Text(
                hadethArgs.content[index],
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
