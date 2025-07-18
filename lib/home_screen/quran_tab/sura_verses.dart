import 'package:flutter/material.dart';

import '../../appcolors.dart';

class SuraVerses extends StatefulWidget {
  String content;
  int index;

  SuraVerses({super.key, required this.content, required this.index});

  @override
  State<SuraVerses> createState() => _SuraVersesState();
}

class _SuraVersesState extends State<SuraVerses> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
      child: GestureDetector(
        onTap: () {
          isSelected = !isSelected;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.gold : AppColors.black,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.gold),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              '[${widget.index + 1}] ${widget.content}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected ? AppColors.black : AppColors.gold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
