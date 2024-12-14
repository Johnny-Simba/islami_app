import 'package:flutter/material.dart';
import 'package:islami_app/home/app_colors.dart';
import 'package:islami_app/home/tabs/radio/radio_item_design.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  List<RadioItemDesign> radioChannelsList = [
    RadioItemDesign(title: 'Radio Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Radio Al-Qaria Yassen', play: true),
    RadioItemDesign(title: 'Radio Ahmed Al-trabulsi', play: false),
    RadioItemDesign(title: 'Radio Addokali Mohammad Alalim', play: false),
    RadioItemDesign(title: 'Radio Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Radio Ahmed Al-trabulsi', play: false),
    RadioItemDesign(title: 'Radio Addokali Mohammad Alalim', play: false),
    RadioItemDesign(title: 'Radio Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Radio Ahmed Al-trabulsi', play: false),
    RadioItemDesign(title: 'Radio Addokali Mohammad Alalim', play: false),
  ];
  List<RadioItemDesign> radioRecitersList = [
    RadioItemDesign(title: 'Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Akram Alalaqmi', play: true),
    RadioItemDesign(title: 'Majed Al-Enezi', play: false),
    RadioItemDesign(title: 'Malik shaibat Alhamed', play: false),
    RadioItemDesign(title: 'Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Majed Al-Enezi', play: false),
    RadioItemDesign(title: 'Malik shaibat Alhamed', play: false),
    RadioItemDesign(title: 'Ibrahim Al-Akdar', play: false),
    RadioItemDesign(title: 'Majed Al-Enezi', play: false),
    RadioItemDesign(title: 'Malik shaibat Alhamed', play: false),
  ];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Tab> _tabs = [Tab(text: 'Radio'), Tab(text: 'Reciters')];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(child: Image.asset('assets/images/islami_logo.png')),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.blackBGColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            labelColor: AppColors.blackColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            indicatorColor: null,
            unselectedLabelColor: AppColors.whiteColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryDark,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
          ),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return radioChannelsList[index];
                },
                itemCount: radioChannelsList.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return radioRecitersList[index];
                },
                itemCount: radioRecitersList.length,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
