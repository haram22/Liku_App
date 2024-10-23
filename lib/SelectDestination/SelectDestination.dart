import 'package:flutter/material.dart';

import '../Components/Comp.dart';
import '../Components/Location.dart';
import '../Components/LocationByWord.dart';
import '../Components/SelectComp.dart';
import '../Components/TopBottomComp.dart';
import '../Theme/Colors.dart';

class Selectdestination extends StatefulWidget {
  const Selectdestination({super.key});

  @override
  State<Selectdestination> createState() => _SelectdestinationState();
}

class _SelectdestinationState extends State<Selectdestination> {
  String? _selectedRegion;
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  void _handleRegionSelected(String region) {
    setState(() {
      _selectedRegion = region;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '출발일자, 시간 확인하시고 도착 터미널을 선택하세요.'),
      body: Row(
        children: [
          const Flexible(flex: 2, child: ShowInfo()),
          Flexible(
            flex: 8,
            child: Center(
              child: Column(
                children: [
                  Container(
                    color: primaryPurple,
                    width: double.infinity,
                    child: Center(
                      child: LocationContainer(
                        onRegionSelected: _handleRegionSelected,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      //height: 420,
                      child: Center(
                        child: LocationByWord(
                          selectedRegion: _selectedRegion,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const CommonFloatingButton(screenName: "목적지 선택 화면"),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
