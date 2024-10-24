import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liku/Components/Comp.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/Components/global.dart';
import 'package:liku/SelectSeat/Seat.dart';
import 'package:liku/Theme/Colors.dart';

class Selectseat extends StatefulWidget {
  const Selectseat({super.key});

  @override
  State<Selectseat> createState() => _SelectseatState();
}

class _SelectseatState extends State<Selectseat> {
  late int total = 0;
  int selectedSeatCount = 0;
  bool alert = true;
  int leftSeats = 0;
  void _updateCounts(int newAdult, int newMid, int newChild) {
    setState(() {
      globalAdult.value += newAdult;
      globalMid.value += newMid;
      globalChild.value += newChild;
      alert = (globalAdult.value + globalMid.value + globalChild.value) == 0;
    });
  }

  void _updateSelectedSeats(int count) {
    setState(() {
      selectedSeatCount = count;
    });
  }

  void _handleLeftSeatsCalculated(int seats) {
    leftSeats = seats; // leftSeats 값을 저장
  }

  @override
  Widget build(BuildContext context) {
    total = globalAdult.value + globalMid.value + globalChild.value;
    globalFee.value = NumberFormat('#,###').format(globalAdult.value * 39300 +
        globalMid.value * 31400 +
        globalChild.value * 19700);
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
                        TextSpan(
                            text: "원하시는 ",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        TextSpan(
                            text: "승차권수량을 +, -로 ",
                            style:
                                TextStyle(fontSize: 30, color: primaryYellow)),
                        TextSpan(
                            text: "조정하세요.",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ]),
                    ),
                  ),
                ),
                SelectComp(onCountChanged: _updateCounts, leftSeats: leftSeats),
                Container(
                  width: double.infinity,
                  height: 5,
                  color: Colors.black,
                ),
                Expanded(
                  child: SeatSelectionScreen(
                    alert: alert,
                    maxSelectableSeats: total,
                    onSeatSelected: _updateSelectedSeats,
                    onLeftSeatsCalculated: _handleLeftSeatsCalculated,
                  ),
                ),
                Container(
                  color: primaryBlack,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FinalResult(title: '총수량', data: total.toString()),
                      const SizedBox(width: 30),
                      FinalResult(title: '총금액', data: globalFee.value),
                      const SizedBox(width: 60),
                      OrangeButton(
                        text: '선택완료',
                        selectedSeatCount: selectedSeatCount,
                        maxSelectableSeats: total,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const CommonFloatingButton(screenName: "좌석 선택 화면"),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
