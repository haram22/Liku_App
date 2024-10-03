import 'package:flutter/material.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/Theme/Colors.dart';
import 'package:liku/utils/network_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    NetworkUtils.sendMessageToServer("The user is in inital screen. Now instruct the user on what they need to do. [Example] '안녕하세요. 키오스크 교육에 참여해 주셔서 감사합니다. 이번 해볼 미션은 {부산해운대}로 가는 {18시 30분} 버스를 선택해 {어른 승차권 2매}를 예매 하는 것입니다. 화면 오른쪽 보라색 버튼을 눌러 목적지 화면으로 이동하세요.' 이런 형태로 처음 안내하면 돼.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeHeaderComp(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '한차원높은\n',
                    style: TextStyle(
                      color: primaryRed,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '전국 시외버스 통합 예매 · 발권 시스템',
                    style: TextStyle(
                      color: primaryPurple,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '으로\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '안전',
                    style: TextStyle(
                      color: primaryRed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '하고 ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '편안',
                    style: TextStyle(
                      color: primaryRed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '하게!\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Ver 1.3.2.42451\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      print("버튼이 눌렸습니다");
                      NetworkUtils.sendMessageToServer("사용자는 처음 화면에서 주황색 버튼을 눌렀습니다.");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryOrange,
                      shape: const CircleBorder(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '모바일/인터넷\n예매발권',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '모바일/인터넷에서\n예매하신 승차권 발매',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        CustomPaint(painter: ArrowPainter())
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      NetworkUtils.sendMessageToServer("사용자는 처음 화면에서 보라색 버튼을 눌렀습니다. 목적지 화면으로 이동합니다.");
                      Navigator.pushReplacementNamed(context, '/selectDest');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800],
                      shape: const CircleBorder(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '당일/예매 발권',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '출발일자와 출발시간을\n선택하여 승차권 구매',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        CustomPaint(painter: ArrowPainter())
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
