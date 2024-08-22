import 'package:flutter/material.dart';

import '../Theme/Colors.dart';

class LocationContainer extends StatefulWidget {
  final ValueChanged<String> onRegionSelected;

  const LocationContainer({Key? key, required this.onRegionSelected})
      : super(key: key);

  @override
  _LocationContainerState createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  String? _selectedRegion;

  // 지역과 그에 해당하는 출발지 목록을 정의
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

  @override
  Widget build(BuildContext context) {
    final regions = regionLocations.keys.toList();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3.0),
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 2.5,
            shrinkWrap: true,
            children: regions.map((region) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRegion = region;
                  });
                  widget.onRegionSelected(region);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedRegion == region
                        ? primaryPurple
                        : primaryBlack,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      region,
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
