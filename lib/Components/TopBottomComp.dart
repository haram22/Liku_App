import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liku/Components/global.dart';
import 'package:liku/Theme/Colors.dart';
import 'package:liku/utils/network_utils.dart';
import 'package:marquee/marquee.dart';

import 'RealTime.dart';

class Headercomp extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const Headercomp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.grey,
      flexibleSpace: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 왼쪽 구역
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize:
                        Size(MediaQuery.of(context).size.width * 0.15, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    backgroundColor: primaryRed,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (text == "카드를 인식시켜주세요"){
                      NetworkUtils.sendMessageToServer("RESTART");
                    }else{
                      NetworkUtils.sendMessageToServer("처음화면으로 이동합니다.");
                    }
                    currentPageNotifier.value = 0;
                    destNotifier.value = "-";
                    timeNotifier.value = "-";
                    globalAdult.value = 0;
                    globalMid.value = 0;
                    globalChild.value = 0;
                    globalFee.value = '';
                    globalDest.value = '';
                    globalTime.value = '';
                    globalPerson.value = '';
                    seatNotifier.value = [];
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.amber[200],
                          ),
                          const Text(
                            '처음화면으로',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Text(
                        '자동종료시간: 24',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
            ),
            const SizedBox(width: 10),
            // 가운데 구역
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primaryBlack,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryYellow,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            // 오른쪽 구역
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  child: Column(
                    children: [
                      RealTimeClock(),
                      Text(
                        '승차권잔여수량',
                        style: TextStyle(color: primaryRed),
                      ),
                      Text(
                        '831',
                        style: TextStyle(color: primaryRed),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}

class HomeHeaderComp extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeaderComp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.grey,
      flexibleSpace: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 왼쪽 구역
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primaryRed,
                ),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Language',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: primaryYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: Size(55, 30),
                          ),
                          onPressed: () {
                            //
                          },
                          child: const Text('Select',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 1, // 선의 높이
                      color: Colors.white, // 선의 색상
                    ),
                    const Text(
                      '한국어',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),

            // 가운데 구역
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primaryBlack,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '동서울 터미널 무인발매기 입니다.',
                    style: TextStyle(
                      color: primaryYellow,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            // 오른쪽 구역
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  child: Column(
                    children: [
                      RealTimeClock(),
                      Text(
                        '승차권잔여수량',
                        style: TextStyle(color: primaryRed),
                      ),
                      Text(
                        '831',
                        style: TextStyle(color: primaryRed),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}

class BottomComp extends StatelessWidget {
  const BottomComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 30, // 컨테이너 높이 설정
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: primaryBlack),
        child: Marquee(
          text: '동서울 터미널 무인발매기 입니다.',
          style: TextStyle(color: Colors.white, fontSize: 15),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          blankSpace: MediaQuery.of(context).size.width * 0.8,
          velocity: -50.0,
          startPadding: 10.0,
          accelerationCurve: Curves.linear,
          decelerationCurve: Curves.easeOut,
          fadingEdgeStartFraction: 0.1, // 시작 부분에 페이딩 효과
          fadingEdgeEndFraction: 0.1, // 끝 부분에 페이딩 효과
        ),
      ),
    );
  }
}

