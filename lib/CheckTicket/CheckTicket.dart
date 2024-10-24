import 'package:flutter/material.dart';
import 'package:liku/Components/global.dart';
import '../Components/Comp.dart';
import '../Components/TopBottomComp.dart';
import '../Theme/Colors.dart';

class Checkticket extends StatefulWidget {
  const Checkticket({super.key});

  @override
  State<Checkticket> createState() => _CheckticketState();
}

class _CheckticketState extends State<Checkticket> {
  final double resultWidth = 140;
  Widget build(BuildContext context) {
    int total = globalAdult.value + globalMid.value + globalChild.value;
    return Scaffold(
      appBar: const Headercomp(text: '선택 내역을 확인하세요.'),
      body: Row(
        children: [
          const Flexible(flex: 2, child: ShowInfo()),
          Flexible(
            flex: 8,
            child: SingleChildScrollView(
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
                              text: "티켓 내역 확인하기",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white))
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: Colors.black,
                  ),
                  // 1
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                            child: TicketResults(
                                title: "출발지",
                                content: "동서울",
                                width: resultWidth)),
                        SizedBox(width: 10),
                        Expanded(
                            child: TicketResults(
                                title: "도착지",
                                content: destNotifier.value,
                                width: resultWidth))
                      ],
                    ),
                  ),
                  // 2
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                            child: TicketResults(
                                title: "출발일자",
                                content: "2022-11-25",
                                width: resultWidth)),
                        SizedBox(width: 10),
                        Expanded(
                            child: TicketResults(
                                title: "출발시간",
                                content: timeNotifier.value,
                                width: resultWidth))
                      ],
                    ),
                  ),
                  // 3
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                            child: TicketResults(
                                title: "버스등급",
                                content: "우등",
                                width: resultWidth)),
                        SizedBox(width: 10),
                        Expanded(
                            child: TicketResults(
                                title: "버스회사",
                                content: "경남고속뉴부산",
                                width: resultWidth))
                      ],
                    ),
                  ),
                  // 4
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                            child: TicketResults(
                                title: "매수",
                                content: total.toString(),
                                width: resultWidth)),
                        SizedBox(width: 10),
                        Expanded(
                            child: TicketResults(
                                title: "요금(원금액)",
                                content: globalFee.value,
                                width: resultWidth))
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                      child: Expanded(
                          child: TicketResults(
                              title: "요금정보",
                              content: globalInfo.value,
                              width: resultWidth))),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                      child: Expanded(
                          child: TicketResults(
                              title: "좌석",
                              content: seatNotifier.value.join(", "),
                              width: resultWidth))),
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10.0, left: 40, right: 40),
                      child: Expanded(
                          child: TicketResults(
                              title: "경유지",
                              content: "동서울 -> ${destNotifier.value}",
                              width: resultWidth))),
                  SizedBox(height: 20),
                  OrangeButton(text: "카드결제")
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: const CommonFloatingButton(screenName: "결제 화면"),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
