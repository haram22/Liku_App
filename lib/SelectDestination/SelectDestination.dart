import 'package:flutter/material.dart';

import '../Components/Comp.dart';
import '../Components/Location.dart';
import '../Components/LocationByWord.dart';
import '../Components/SelectComp.dart';
import '../Components/TextWord.dart';
import '../Components/TopBottomComp.dart';
import '../Theme/Colors.dart';

class Selectdestination extends StatefulWidget {
  const Selectdestination({super.key});

  @override
  State<Selectdestination> createState() => _SelectdestinationState();
}

class _SelectdestinationState extends State<Selectdestination> {
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
                    color: primaryBlack,
                    width: double.infinity,
                    height: 170,
                    child: Center(child: LocationContainer()),
                  ),
                  Container(
                    color: primaryBlack,
                    width: double.infinity,
                    height: 125,
                    child: Center(child: TextWordView()),
                  ),
                  Container(
                    color: primaryBlack,
                    width: double.infinity,
                    height: 320,
                    child: Center(child: LocationByWord()),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50.0, right: 100),
                  //   child: Positioned(
                  //     top: 50,
                  //     child: ButtonComp(),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
