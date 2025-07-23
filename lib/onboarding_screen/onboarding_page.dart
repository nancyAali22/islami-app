import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';

import 'onboarding_data.dart';

class OnBoaringPage extends StatelessWidget {
  final OnBoardingData onBoardingData;

  const OnBoaringPage({required this.onBoardingData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FadeInImage(
                  placeholder: const AssetImage('assets/images/empty.png'),
                  image: AssetImage(onBoardingData.imagePath)),
              const SizedBox(
                height: 42,
              ),
              Text(
                onBoardingData.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.gold,
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              Text(
                onBoardingData.description != null
                    ? onBoardingData.description!
                    : '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 2,
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
