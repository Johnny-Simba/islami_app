import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/hadeeth/hadeeth_tab.dart';
import 'package:islami_app/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryDark),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 0, imageName: 'quran_icon'),
                      label: 'Quran'
                  ),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 1, imageName: 'hadeeth_icon'),
                      label: 'Hadeeth'
                  ),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 2, imageName: 'sebha_icon'),
                      label: 'Sebha'
                  ),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 3, imageName: 'radio_icon'),
                      label: 'Radio'
                  ),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 4, imageName: 'time_icon'),
                      label: 'Time'
                  ),
                ]
            ),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBGColor,
            ),
            child: ImageIcon(AssetImage('assets/images/$imageName.png')))
        : ImageIcon(AssetImage('assets/images/$imageName.png'));
  }
}