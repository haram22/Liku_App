import 'package:flutter/material.dart';

import '../Components/Comp.dart';
import '../Components/GridComp.dart';
import '../Components/SelectComp.dart';
import '../Components/TopBottomComp.dart';

class Selectdestination extends StatefulWidget {
  const Selectdestination({super.key});

  @override
  State<Selectdestination> createState() => _SelectdestinationState();
}

class _SelectdestinationState extends State<Selectdestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '동서울 터미널 무인발매기 입니다.'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ShowInfo(),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 1050,
                        height: 282,
                        child: LocationContainer(),
                      ),
                      AspectRatio(
                        aspectRatio: 1050 / 180,
                        child: Container(
                          alignment: Alignment.center,
                          child: TextWordView(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ButtonComp(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomComp(),
    );
  }
}
