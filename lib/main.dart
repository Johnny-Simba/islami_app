import 'package:flutter/material.dart';
import 'package:islami_app/home/app_theme.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/tabs/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_app/home/tabs/quran/sura_details_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen(),
      },
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
