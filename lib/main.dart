import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home_screen/quran_tab/sura_details.dart';

import 'home_screen/home_screen.dart';
import 'my_theme_data.dart';

void main() {
  runApp(const islami());
}

class islami extends StatelessWidget {
  const islami({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        SuraDetails.routename: (context) => SuraDetails(),
      },
      initialRoute: HomeScreen.routename,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
