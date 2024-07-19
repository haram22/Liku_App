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
      color: primaryPurple, // 배경색 설정
      child: GridView.count(
        crossAxisCount: 8, // 한 줄에 8개의 아이템
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        childAspectRatio: 1.5,
        children: List.generate(items.length, (index) {
          return Container(
            height: 20,
            decoration: BoxDecoration(
              color: index == items.length - 1
                  ? primaryPurple
                  : Colors.white, // '전체' 항목의 배경색은 보라색
              borderRadius: BorderRadius.circular(4.0), // 모서리 반경 설정
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 15.0,
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

class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '특별/광역/자치',
      '강원도',
      '경기도',
      '경상남도',
      '경상북도',
      '전라남도',
      '전라북도',
      '충청남도',
      '충청북도',
      '전국'
    ];

    return Container(
      padding: EdgeInsets.all(3.0),
      color: Colors.white, // 배경색 설정
      child: GridView.count(
        crossAxisCount: 6, // 한 줄에 8개의 아이템
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        childAspectRatio: 2,
        children: List.generate(items.length, (index) {
          return Container(
            decoration: BoxDecoration(
              color: index == items.length - 1
                  ? primaryPurple
                  : primaryBlack, // '전체' 항목의 배경색은 보라색
              borderRadius: BorderRadius.circular(4.0), // 모서리 반경 설정
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
