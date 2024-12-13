import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/quran/sura_content_item.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Sura Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.suraEnglishName),
      ),
      body: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
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
                  height: 17,
                ),
                Text(
                  args.suraArabicName,
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                (args.index == 0 || args.index == 8)
                    ? Text('')
                    : Text(
                        'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                        style: TextStyle(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                Expanded(
                    child: verses.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryDark,
                            ),
                          )
                        : NotificationListener(
                            onNotification: (scrollNotification) {
                              // Do nothing to prevent effects
                              return true;
                            },
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return SuraContentItem(
                                    content: allSuraContent(verses));
                              },
                              itemCount: 1,
                            ),
                          ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent.split('\n');
    verses = suraLines;
    setState(() {});
  }

  String allSuraContent(List<String> suraLines) {
    String allSuraContent = '';
    for (int i = 0; i < suraLines.length; i++) {
      allSuraContent += '${suraLines[i]} {${i + 1}} ';
    }
    return allSuraContent;
  }
}
