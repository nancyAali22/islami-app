import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';
import 'package:islami_app/home_screen/hadith_tab/hadith_model.dart';

class HadithDetails extends StatelessWidget {
  static const String routename = '/hadithDetails';

  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
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
              Text(args.title,
                  style: const TextStyle(
                      color: AppColors.gold,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: args.content.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Text(
                          args.content[index],
                          style: const TextStyle(
                              color: AppColors.gold,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
