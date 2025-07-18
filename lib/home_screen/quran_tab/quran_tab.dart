import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';
import 'package:islami_app/home_screen/quran_tab/sura_details.dart';
import 'package:islami_app/home_screen/quran_tab/suras_list_item.dart';

import 'lists.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                hintText: 'Sura Name',
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.gold, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.gold,
                      width: 1,
                    )),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.gold,
                      width: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.gold,
                      width: 1,
                    )),
                prefixIcon: const ImageIcon(
                    AssetImage('assets/images/quran-svgrepo-com 1.png')),
                prefixIconColor: AppColors.gold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, bottom: 8),
          child: Text(
            'Most Recently ',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 8),
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Al-Anbiya',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text('الأنبياء',
                            style: Theme.of(context).textTheme.titleLarge),
                        Text('112 Verses',
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/iq_recently.png')
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 24),
          child: Text(
            'Suras List',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.white),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuraDetails.routename,
                        arguments: SuraDetailsArgs(
                            suraArName: suraAr[index],
                            suraEnName: suraEn[index],
                            index: index));
                  },
                  child: SuraListItem(
                    suraAr: suraAr[index],
                    suraEn: suraEn[index],
                    ayaNumber: ayaNumber[index],
                    index: index + 1,
                  ),
                );
              },
              itemCount: ayaNumber.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.5,
                  endIndent: 60,
                  indent: 60,
                  color: AppColors.white,
                );
              }),
        )
      ],
    );
  }
}
