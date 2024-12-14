import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';

class RadioItemDesign extends StatelessWidget {
  String title;
  bool play;

  RadioItemDesign({required this.title, required this.play});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/images/radio_bg_item.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('assets/images/love_icon.png'))),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image(
                            image: play == true
                                ? AssetImage('assets/images/PauseIcon.png')
                                : AssetImage('assets/images/play_icon.png'))),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('assets/images/sound_icon.png'))),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ));
  }
}
