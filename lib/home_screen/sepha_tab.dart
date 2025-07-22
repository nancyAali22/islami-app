import 'dart:math';

import 'package:flutter/material.dart';

class SephaTab extends StatefulWidget {
  const SephaTab({super.key});

  @override
  State<SephaTab> createState() => _SephaTabState();
}

class _SephaTabState extends State<SephaTab> {
  List<String> sephaList = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ'
  ];

  late String sephaTitle = sephaList[0];

  int counter = 0;
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Image.asset('assets/images/Logo.png'),
        ),
        const Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const Row(),
              Image.asset(
                'assets/images/headsepha.png',
                height: MediaQuery.of(context).size.height * .12,
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.085,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: InkWell(
                    onTap: () {
                      _loadSepha();
                    },
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 2000),
                          child: Image.asset(
                            'assets/images/SebhaBody.png',
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 140,
                            ),
                            const Row(),
                            Text(
                              sephaTitle,
                              style: const TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              counter.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _loadSepha() {
    counter++;
    turns = turns + (pi / 33);
    if (counter == 34) {
      sephaTitle = sephaList[(sephaList.indexOf(sephaTitle) + 1) % 3];
      counter = 0;
    }
    setState(() {});
  }
}
