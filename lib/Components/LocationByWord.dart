import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class LocationByWord extends StatelessWidget {
  const LocationByWord({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '15초소',
      '38연대',
      '6사단',
      '가산',
      '가온',
      '가천대',
      '가평',
      '간성',
      '간척사거리',
      '갈운리',
      '감곡',
      '강릉시외터미널',
      '강촌',
      '가포리',
      '거제(고현)'
    ];

    return Container(
      padding: EdgeInsets.all(3.0),
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 2.5,
        children: List.generate(items.length, (index) {
          return Container(
            decoration: BoxDecoration(
              color: primaryBlack,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
