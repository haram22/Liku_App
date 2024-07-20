import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';
import 'package:marquee/marquee.dart';

class Headercomp extends StatelessWidget implements PreferredSizeWidget {
  const Headercomp({super.key});

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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    backgroundColor: primaryRed,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    //
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
                          Text(
                            '처음화면으로',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Text(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '동서울 터미널 무인발매기 입니다.',
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
            const Expanded(
              child: DefaultTextStyle(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                child: Column(
                  children: [
                    Text(
                      '2022-11-25',
                    ),
                    Text(
                      '10:33:02',
                    ),
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
          borderRadius: BorderRadius.circular(10),
          color: Colors.black, // 여기서 primaryBlack 대신 직접 색상을 지정했습니다.
        ),
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
