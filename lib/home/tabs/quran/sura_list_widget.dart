import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';

class SuraListWidget extends StatelessWidget {
  int index;

  String suraEnName;
  String suraArName;
  String ayaNumber;

  SuraListWidget(
      {required this.index,
      required this.suraEnName,
      required this.suraArName,
      required this.ayaNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/islamic_star_vector.png'),
            Text(
              '$index',
              style: TextStyle(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(suraEnName,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold)),
                  Text('$ayaNumber verses',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                suraArName,
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
