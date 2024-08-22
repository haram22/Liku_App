import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

class TextWordView extends StatefulWidget {
  const TextWordView({Key? key}) : super(key: key);

  @override
  State<TextWordView> createState() => _TextWordViewState();
}

class _TextWordViewState extends State<TextWordView> {
  final List<String> items = [
    'ㄱ',
    'ㄴ',
    'ㄷ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅅ',
    'ㅇ',
    'ㅈ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ',
    '기타',
    '전체'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      color: primaryPurple,
      child: GridView.count(
        crossAxisCount: 8,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        childAspectRatio: 2.5,
        children: List.generate(items.length, (index) {
          return Container(
            height: 20,
            decoration: BoxDecoration(
              color: index == items.length - 1 ? primaryPurple : Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color:
                      index == items.length - 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
