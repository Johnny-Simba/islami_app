import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0, totalCounter = 0;

  String zekr = 'سبحــان الله';

  List<String> azkarList = [
    'سبحــان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/islami_logo.png'),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            counter++;
            totalCounter++;
            sebhaFlow();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/sebha_design.png'),
              Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(zekr,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('$counter',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${totalCounter} : إجمالي عدد التسبيحات',
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }

  void sebhaFlow() {
    if (totalCounter == 33) {
      zekr = azkarList[1];
      counter = 0;
    }
    if (totalCounter == 66) {
      zekr = azkarList[2];
      counter = 0;
    }
    if (totalCounter == 100) {
      zekr = azkarList[0];
      counter = 0;
      totalCounter = 0;
    }
    setState(() {});
  }
}
