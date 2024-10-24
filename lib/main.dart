import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/SelectSeat/SelectSeat.dart';
import 'package:liku/SelectTime/SelectTime.dart';
import 'package:liku/utils/network_utils.dart';
import 'CheckTicket/CheckTicket.dart';
import 'Components/Comp.dart';
import 'Components/Location.dart';
import 'Home/Home.dart';
import 'Payment/Payment.dart';
import 'SelectDestination/SelectDestination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NetworkUtils.sendMessageToServer(
    "The user is in inital screen. Now instruct the user on what they need to do. [Example] '안녕하세요. 키오스크 교육에 참여해 주셔서 감사합니다. 이번 해볼 미션은 {목적지}로 가는 {버스시간} 버스를 선택해 {인원}을 예매 하는 것입니다. 화면 오른쪽 보라색 버튼을 눌러 목적지 화면으로 이동하세요.' 이런 형태로 처음 안내하면 돼.");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/selectTime': (context) => SelectTime(),
        '/selectSeat': (context) => Selectseat(),
        '/selectDest': (context) => Selectdestination(),
        '/checkTicket': (context) => Checkticket(),
        '/payment': (context) => PaymentPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '동서울 터미널 무인발매기 입니다.'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // OrangeButton(text: "text"),
              ShowInfo(),
              FinalResult(title: "총 수량", data: "10"),
              TicketResults(title: "출발지", content: "동서울", width: 100),
              SizedBox(height: 5),
              Container(
                  alignment: Alignment.center,
                  width: 450,
                  height: 82,
                  child: LocationContainer(
                    onRegionSelected: (String selectedRegion) {
                      if (selectedRegion == '강원도') {
                        print('강원도가 선택되었습니다.');
                      } else {
                        print('$selectedRegion가 선택되었습니다.');
                      }
                    },
                  )),
              //ButtonComp()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomComp(),
    );
  }
}
