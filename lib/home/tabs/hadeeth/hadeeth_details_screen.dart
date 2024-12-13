import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/hadeeth/hadeeth_model.dart';

class HadeethDetailsScreen extends StatelessWidget {
  static const String routeName = 'Hadeeth Details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethModel;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            //padding: EdgeInsets.only(top: 50),
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                args.title,
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                  child: NotificationListener(
                onNotification: (scrollNotification) {
                  // Do nothing to prevent effects
                  return true;
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        args.content.join(''),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.primaryDark),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    );
                  },
                  itemCount: 1,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
