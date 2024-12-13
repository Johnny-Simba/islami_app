import 'package:flutter/cupertino.dart';
import 'package:islami_app/home/app_colors.dart';

class SuraContentItem extends StatelessWidget {
  String content;

  SuraContentItem({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        content,
        style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
