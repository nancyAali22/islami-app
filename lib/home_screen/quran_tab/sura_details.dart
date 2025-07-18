import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/appcolors.dart';
import 'package:islami_app/home_screen/quran_tab/sura_verses.dart';

class SuraDetails extends StatefulWidget {
  static const String routename = '/SuraDetails';

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          args.suraEnName,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.gold),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/sura_details.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                args.suraArName,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.gold),
              ),
              const SizedBox(
                height: 40,
              ),
              verses.isEmpty
                  ? Center(child: const CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          itemCount: verses.length,
                          itemBuilder: (context, index) {
                            return SuraVerses(
                                content: verses[index], index: index);
                          }),
                    )
            ],
          ),
        ],
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraArName;
  String suraEnName;
  int index;

  SuraDetailsArgs(
      {required this.suraArName,
      required this.suraEnName,
      required this.index});
}
