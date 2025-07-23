import 'package:flutter/material.dart';
import 'package:islami_app/appcolors.dart';

class DotIndicator extends StatelessWidget {
  bool isActive;

  DotIndicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(6),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.gold : AppColors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
