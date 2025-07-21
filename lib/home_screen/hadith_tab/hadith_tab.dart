import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/appcolors.dart';

import 'hadith_details.dart';
import 'hadith_model.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Image.asset('assets/images/hadith_logo.png'),
          ),
          hadithList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    height: 600,
                    viewportFraction: 0.75,
                  ),
                  itemCount: hadithList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(HadithDetails.routename,
                            arguments: hadithList[itemIndex]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/hadith_content.png'))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 16),
                              child: Text(
                                hadithList[itemIndex].title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                hadithList[itemIndex].content.join(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      HadithModel hadithModel = HadithModel(content: hadithLines, title: title);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
