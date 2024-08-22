import 'package:flutter/material.dart';
import '../Theme/Colors.dart';

class LocationByWord extends StatefulWidget {
  final String? selectedRegion;

  const LocationByWord({Key? key, required this.selectedRegion})
      : super(key: key);

  @override
  _LocationByWordState createState() => _LocationByWordState();
}

class _LocationByWordState extends State<LocationByWord> {
  String? _selectedConsonant;

  final Map<String, List<String>> regionLocations = {
    '특별/광역/자치': ['서울', '부산', '대구'],
    '강원도': [
      '15초소',
      '38연대',
      '6사단',
      '가천대',
      '가평',
      '감곡',
      '강릉시외터미널',
      '강촌',
      '가포리',
      '거제(고현)'
    ],
    '경기도': ['수원', '성남', '고양'],
    '경상남도': ['창원', '진주', '통영'],
    '경상북도': ['포항', '구미', '경주'],
    '전라남도': ['목포', '여수', '순천'],
    '전라북도': ['전주', '익산', '군산'],
    '충청남도': ['천안', '공주', '아산'],
    '충청북도': ['청주', '충주', '제천'],
    '전국': ['서울', '부산', '대구', '가평', '간성', '6사단'],
  };

  final List<String> consonants = [
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
    final List<String>? items = selectedRegionItems();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          color: primaryBlack,
          child: GridView.count(
            crossAxisCount: 8,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 2.5,
            shrinkWrap: true,
            children: consonants.map((consonant) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedConsonant = consonant == '전체' ? null : consonant;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedConsonant == consonant
                        ? primaryPurple
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      consonant,
                      style: TextStyle(
                          fontSize: 26.0,
                          color: primaryBlack,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 330,
            color: Colors.white,
            child: Expanded(
              child: items != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                style: TextStyle(
                                    fontSize: 26.0, color: Colors.white),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  : Center(
                      child: Text(
                        '지역을 선택하세요',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  List<String>? selectedRegionItems() {
    final List<String>? items = regionLocations[widget.selectedRegion];

    if (items == null) return null;

    if (_selectedConsonant != null) {
      return items.where((item) {
        final consonant = getConsonant(item);
        return consonant == _selectedConsonant;
      }).toList();
    }

    return items;
  }
}

String? getConsonant(String input) {
  if (input.isEmpty) return null;

  final int codeUnit = input.codeUnitAt(0);

  // 한글의 범위인지 확인
  if (codeUnit < 0xAC00 || codeUnit > 0xD7A3) {
    return null; // 한글이 아니면 null을 반환
  }

  final int firstConsonantIndex = ((codeUnit - 0xAC00) ~/ 28) ~/ 21;
  const consonantsList = [
    'ㄱ',
    'ㄲ',
    'ㄴ',
    'ㄷ',
    'ㄸ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅃ',
    'ㅅ',
    'ㅆ',
    'ㅇ',
    'ㅈ',
    'ㅉ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ'
  ];

  return consonantsList[firstConsonantIndex];
}
