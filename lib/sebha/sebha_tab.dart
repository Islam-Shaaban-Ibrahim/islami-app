import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/app_theming.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

double turn = 0.0;
int sebhaCounter = 0;
String tasbeh = 'سبحان الله';

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional(.01, -2.4),
          children: [
            GestureDetector(
              onTap: () {
                counterAndTasbeeh();
              },
              child: Transform.rotate(
                angle: turn,
                child: Image.asset(
                  "assets/images/sebha_image.png",
                ),
              ),
            ),
            Image.asset(
              "assets/images/sebha_head.png",
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "عدد التسبيحات",
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
                color: MyAppTheme.sebhaCounterColor,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Text(
            tasbeh,
            style: TextStyle(color: MyAppTheme.white),
          ),
          width: MediaQuery.of(context).size.width * 0.35,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)),
        ),
      ],
    );
  }

  counterAndTasbeeh() {
    if (sebhaCounter == 99) {
      sebhaCounter = -1;
      tasbeh = 'سبحان الله';
    }
    turn += 1;
    if (sebhaCounter >= 0 && sebhaCounter < 33) {
      tasbeh = 'سبحان الله';
    } else if (sebhaCounter >= 33 && sebhaCounter < 66) {
      tasbeh = "الحمد لله";
    } else if (sebhaCounter >= 66 && sebhaCounter < 99) {
      tasbeh = "الله أكبر";
    }
    sebhaCounter++;
    setState(() {});
  }
}
