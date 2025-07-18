import 'package:flutter/material.dart';

import '../../appcolors.dart';

class SuraListItem extends StatelessWidget {
  String suraAr;
  String suraEn;
  int index;
  String ayaNumber;

  SuraListItem(
      {super.key,
      required this.index,
      required this.suraEn,
      required this.suraAr,
      required this.ayaNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/Vector (1).png'),
              Text(
                '$index',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suraEn,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '$ayaNumber verses',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 14, color: AppColors.white),
                      )
                    ],
                  ),
                  Text(suraAr,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColors.white))
                ]),
          ),
        ),
      ],
    );
  }
}
