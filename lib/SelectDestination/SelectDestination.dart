import 'package:flutter/material.dart';
import 'package:liku/utils/network_utils.dart';

import '../Components/Comp.dart';
import '../Components/Location.dart';
import '../Components/LocationByWord.dart';
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
  bool overlayShown = false;
  void _handleRegionSelected(String region) {
    setState(() {
      _selectedRegion = region;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면이 처음 렌더링될 때만 오버레이를 한 번만 호출
    if (!overlayShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        String message = "사용자는 처음 화면에서 보라색 버튼을 눌렀습니다. 목적지 화면으로 이동합니다.";
        NetworkUtils.sendMessageAndShowResponse(context, message);
        setState(() {
          overlayShown = true; // 오버레이가 한 번 표시된 후 플래그를 true로 설정
        });
      });
    }
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
