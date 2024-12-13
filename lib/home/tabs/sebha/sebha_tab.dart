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
  double _rotationAngle = 0;

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
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                counter++;
                totalCounter++;
                sebhaFlow();
              },
              child: AnimatedRotation(
                  turns: _rotationAngle / 360,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset('assets/images/sebha1_design.png')),
            ),
            Column(
                children: [
                  SizedBox(
                  height: 10,
                ),
                  Text(zekr,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('$counter',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 30,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${totalCounter} : إجمالي عدد التسبيحات',
                  style: TextStyle(
                      color: AppColors.primaryDark,
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
    _rotationAngle += 10;
    setState(() {});
  }
}
