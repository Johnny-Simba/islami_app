import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;

  SuraListWidget({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/islamic_star_vector.png'),
            Text(
              '${suraModel.index + 1}',
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
                  Text(suraModel.suraEnglishName,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold)),
                  Text('${suraModel.numOfVerses} verses',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                suraModel.suraArabicName,
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
