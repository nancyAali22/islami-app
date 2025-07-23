import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/home_screen.dart';
import 'dot_indicator.dart';
import 'onboarding_data.dart';
import 'onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static String routename = '/OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingData> OnBoardingList = [
    OnBoardingData(
        imagePath: 'assets/images/intro1.png', title: 'Welcome To Islmi App'),
    OnBoardingData(
        imagePath: 'assets/images/intro2.png',
        title: 'Welcome To Islami',
        description: 'We Are Very Excited To Have You In Our Community'),
    OnBoardingData(
        imagePath: 'assets/images/intro3.png',
        title: 'Reading the Quran',
        description: 'Read, and your Lord is the Most Generous'),
    OnBoardingData(
        imagePath: 'assets/images/intro4.png',
        title: 'Bearish',
        description: 'Praise the name of your Lord, the Most High'),
    OnBoardingData(
        imagePath: 'assets/images/intro5.png',
        title: 'Holy Quran Radio',
        description:
            'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];

  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      ;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Image.asset('assets/images/Logo.png'),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => OnBoaringPage(
                onBoardingData: OnBoardingList[index],
              ),
              itemCount: OnBoardingList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(alignment: Alignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                              pageController.animateToPage(currentIndex - 1,
                                  duration: Duration(milliseconds: 30),
                                  curve: Curves.fastOutSlowIn);
                            }
                          : null,
                      child: Text(
                        currentIndex != 0 ? 'Back' : '',
                        style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          _onBoardingDone();
                        } else {
                          pageController.animateToPage(currentIndex + 1,
                              duration: const Duration(milliseconds: 30),
                              curve: Curves.fastOutSlowIn);
                        }
                        ;
                      },
                      child: Text(
                        currentIndex != 4 ? 'Next' : 'Finish',
                        style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotIndicator(
                    isActive: currentIndex == 0,
                  ),
                  DotIndicator(
                    isActive: currentIndex == 1,
                  ),
                  DotIndicator(
                    isActive: currentIndex == 2,
                  ),
                  DotIndicator(
                    isActive: currentIndex == 3,
                  ),
                  DotIndicator(
                    isActive: currentIndex == 4,
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  void _onBoardingDone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('firstTime', false);
    Navigator.pushNamed(context, HomeScreen.routename);
  }
}
