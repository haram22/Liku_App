import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liku/Components/Comp.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/SelectSeat/Seat.dart';
import 'package:liku/Theme/Colors.dart';

class Selectseat extends StatefulWidget {
  const Selectseat({super.key});

  @override
  State<Selectseat> createState() => _SelectseatState();
}

class _SelectseatState extends State<Selectseat> {
  int adult = 0; // 어른
  int mid = 0; // 중고등학생
  int child = 0; // 어린이
  bool alert = true;
  void _updateCounts(int newAdult, int newMid, int newChild) {
    setState(() {
      adult += newAdult;
      mid += newMid;
      child += newChild;
      alert = (adult + mid + child) == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '티켓 수량과 좌석을 선택하세요.'),
      body: Row(
        children: [
          const Flexible(flex: 2, child: ShowInfo()),
          Flexible(
            flex: 8,
            child: Column(
              children: [
                Container(
                  color: primaryBlack,
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(text: "원하시는 ", style: TextStyle(fontSize: 30)),
                        TextSpan(
                            text: "승차권수량을 +, -로 ",
                            style:
                                TextStyle(fontSize: 30, color: primaryYellow)),
                        TextSpan(
                            text: "조정하세요.", style: TextStyle(fontSize: 30)),
                      ]),
                    ),
                  ),
                ),
                SelectComp(onCountChanged: _updateCounts),
                Container(
                  width: double.infinity,
                  height: 5,
                  color: Colors.black,
                ),
                Expanded(
                  child: SeatSelectionScreen(
                    alert: alert,
                  ),
                ),
                Container(
                  color: primaryBlack,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FinalResult(title: '총수량', data: '${adult + mid + child}'),
                      const SizedBox(width: 30),
                      FinalResult(
                          title: '총금액',
                          data: NumberFormat('#,###').format(
                              adult * 39300 + mid * 31400 + child * 19700)),
                      const SizedBox(width: 60),
                      const OrangeButton(text: '선택완료'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
