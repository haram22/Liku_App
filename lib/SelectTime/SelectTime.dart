import 'package:flutter/material.dart';
import 'package:liku/Components/Comp.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/SelectTime/Schedule.dart';
import 'package:liku/Theme/Colors.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  final List<Schedule> schedules = createSampleData();
  int select = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '배차를 선택하세요.'),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: ShowInfo()),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      const SizedBox(
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListView.builder(
                      itemCount: schedules.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400), // 테두리 색상과 두께
                            borderRadius: BorderRadius.circular(5), // 모서리 둥글게
                            color:
                                select == index ? primaryPurple : Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              boxContainer(schedules[index].time, index,
                                  flex: 1),
                              boxContainer(schedules[index].destStation, index,
                                  flex: 2),
                              boxContainer(schedules[index].form, index,
                                  flex: 1),
                              boxContainer(schedules[index].grade, index,
                                  flex: 1),
                              boxContainer(schedules[index].company, index,
                                  flex: 1),
                              boxContainer(schedules[index].duration, index,
                                  flex: 1),
                              boxContainer(schedules[index].state, index,
                                  flex: 1),
                              boxContainer(
                                  schedules[index].leftSeat.toString(), index,
                                  flex: 1),
                              boxContainer(
                                  schedules[index].totalSeat.toString(), index,
                                  flex: 1),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(80, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: primaryRed,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    select = index;
                                  });
                                },
                                child: const Text(
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
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "요금 · 경유지 정보",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "어른: \u20A939,300, 중고20: \u20A931,400, 아동50: \u20A919,700",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "동서울 -> 양산 -> 부산 해운대",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: ButtonComp(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }

  // Function
  Widget boxContainer(String text, index, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black)), // 세로 구분선
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          text,
          textAlign: TextAlign.center, // 텍스트를 중앙 정렬
          style: TextStyle(
            fontSize: 16,
            color: select == index ? Colors.white : Colors.black,
          ), // 폰트 크기
        ), // 텍스트 패딩
      ),
    );
  }
}
