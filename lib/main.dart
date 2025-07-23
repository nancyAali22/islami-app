import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/home_screen/quran_tab/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen/hadith_tab/hadith_details.dart';
import 'my_theme_data.dart';
import 'onboarding_screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isfirst = await _checkIsFirst();
  runApp(islami(firstTime: isfirst));
}

Future<bool> _checkIsFirst() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var firsTime = preferences.getBool('firstTime') ?? true;
  return firsTime;
}

class islami extends StatelessWidget {
  final bool firstTime;

  const islami({required this.firstTime, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingScreen.routename: (context) => OnBoardingScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        SuraDetails.routename: (context) => const SuraDetails(),
        HadithDetails.routename: (context) => const HadithDetails(),
      },
      initialRoute:
          firstTime ? OnBoardingScreen.routename : HomeScreen.routename,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
