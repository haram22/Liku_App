import 'package:flutter/material.dart';
import 'package:liku/SelectTime/Schedule.dart';
import 'package:liku/Theme/Colors.dart';
import 'package:marquee/marquee.dart';

class SlectTime extends StatefulWidget {
  const SlectTime({super.key});

  @override
  State<SlectTime> createState() => _SlectTimeState();
}

class _SlectTimeState extends State<SlectTime> {
  final List<Schedule> schedules = createSampleData();
  int select = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          //backgroundColor: Colors.grey,
          flexibleSpace: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 왼쪽 구역
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.11,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
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
                const SizedBox(width: 10),
                // 가운데 구역
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: primaryBlack,
                  ),
                  child: Row(
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
                Expanded(
                  child: Container(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      child: const Column(
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
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Component
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  boxContainer('출발시간', -1, flex: 1),
                  boxContainer('도착지', -1, flex: 2),
                  boxContainer('운행형태', -1, flex: 1),
                  boxContainer('등급', -1, flex: 1),
                  boxContainer('운수사', -1, flex: 1),
                  boxContainer('소요시간', -1, flex: 1),
                  boxContainer('상태', -1, flex: 1),
                  boxContainer('잔여석', -1, flex: 1),
                  boxContainer('총 좌석', -1, flex: 1),
                  Container(
                    width: 80,
                    child: Text('배차 선택',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade400), // 테두리 색상과 두께
                      borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                      color: select == index ? primaryPurple : Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        boxContainer(schedules[index].time, index, flex: 1),
                        boxContainer(schedules[index].destStation, index,
                            flex: 2),
                        boxContainer(schedules[index].form, index, flex: 1),
                        boxContainer(schedules[index].grade, index, flex: 1),
                        boxContainer(schedules[index].company, index, flex: 1),
                        boxContainer(schedules[index].duration, index, flex: 1),
                        boxContainer(schedules[index].state, index, flex: 1),
                        boxContainer(
                            schedules[index].leftSeat.toString(), index,
                            flex: 1),
                        boxContainer(
                            schedules[index].totalSeat.toString(), index,
                            flex: 1),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: primaryRed,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            setState(() {
                              select = index;
                              print(select);
                            });
                          },
                          child: Text(
                            "선택",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      //
                    },
                    child: Text(
                      '< 이전',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      //
                    },
                    child: Text(
                      '이후 >',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
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
      ),
    );
  }

  // Function
  Widget boxContainer(String text, index, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black)), // 세로 구분선
        ),
        child: Text(
          text,
          textAlign: TextAlign.center, // 텍스트를 중앙 정렬
          style: TextStyle(
            fontSize: 16,
            color: select == index ? Colors.white : Colors.black,
          ), // 폰트 크기
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5), // 텍스트 패딩
      ),
    );
  }
}
