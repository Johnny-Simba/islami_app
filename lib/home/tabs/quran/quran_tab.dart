import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_app/model/sura_model.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/islami_logo.png')),
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              prefixIcon: ImageIcon(
                AssetImage('assets/images/search_icon.png'),
                color: AppColors.primaryDark,
              ),
              hintText: 'Sura Name',
              hintStyle: TextStyle(color: AppColors.hintColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryDark,
                    width: 2,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Most Recently',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sura En.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sura Ar.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Aya Number.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/most_recently_logo.png')
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Sura List',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 50,
                endIndent: 30,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                      arguments: SuraModel.getSuraModel(index));
                },
                child: SuraListWidget(
                  suraModel: SuraModel.getSuraModel(index),
                ),
              );
            },
            itemCount: SuraModel.getItemCount(),
          ))
        ],
      ),
    );
  }
}
