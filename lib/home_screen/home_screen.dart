import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadith_tab/hadith_tab.dart';
import 'package:islami_app/home_screen/quran_tab/quran_tab.dart';
import 'package:islami_app/home_screen/radio_tab.dart';
import 'package:islami_app/home_screen/sepha_tab.dart';
import 'package:islami_app/home_screen/time_tab.dart';

import '../appcolors.dart';

class HomeScreen extends StatefulWidget {
  static String routename = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<String> images = [
    'assets/images/Background.png',
    'assets/images/hadith_bg.png',
    'assets/images/sepha_bg.png',
    'assets/images/radio_bg (1).png',
    'assets/images/time_bg.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images[selectedindex],
          height: MediaQuery.of(context).size.height * 100,
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
            body: tabs[selectedindex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: AppColors.gold),
              child: BottomNavigationBar(
                  unselectedItemColor: AppColors.black,
                  currentIndex: selectedindex,
                  onTap: (index) {
                    selectedindex = index;
                    setState(() {});
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(
                            index: 0, imageName: 'iq_quran'),
                        label: 'quran'),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(
                            index: 1, imageName: 'iq_hadith'),
                        label: 'hadith'),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(
                            index: 2, imageName: 'iq_sepha'),
                        label: 'sepha'),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(
                            index: 3, imageName: 'iq_radio'),
                        label: 'radio'),
                    BottomNavigationBarItem(
                        icon: builtItemInBottomNavBar(
                            index: 4, imageName: 'iq_time'),
                        label: 'time'),
                  ]),
            )),
      ],
    );
  }

  List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SephaTab(),
    const RadioTab(),
    const TimeTab()
  ];

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedindex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0x99433C2B)),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ))
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
}
