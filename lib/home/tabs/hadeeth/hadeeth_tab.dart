import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_app/home/tabs/hadeeth/hadeeth_model.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<HadeethModel> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethList.isEmpty) {
      loadHadeethFile();
    }
    return hadeethList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Image.asset('assets/images/islami_logo.png'),
              CarouselSlider.builder(
                itemCount: hadeethList.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          HadeethDetailsScreen.routeName,
                          arguments: hadeethList[index]);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/hadeeth_details_bg.png'),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            Text(
                              hadeethList[index].title,
                              style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: Text(
                              hadeethList[index].content.join(''),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ))
                          ],
                        )),
                  );
                },
                options: CarouselOptions(
                    height: 650,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false),
              ),
            ],
          );
  }

  void loadHadeethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadeethFile = await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadeethLines = hadeethFile.split('\n');
      String title = hadeethLines[0];
      hadeethLines.removeAt(0);
      HadeethModel hadeethModel =
          HadeethModel(title: title, content: hadeethLines);
      hadeethList.add(hadeethModel);
      setState(() {});
    }
  }
}
