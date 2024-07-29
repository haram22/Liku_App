import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

class SeatSelectionScreen extends StatefulWidget {
  final bool alert;
  final int maxSelectableSeats;
  const SeatSelectionScreen(
      {super.key, required this.alert, required this.maxSelectableSeats});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  // 좌석 예약 상태를 저장할 리스트
  List<int> reservedSeats = List<int>.generate(45, (index) => 0);
  List<int> seatNo = [
    3,
    6,
    9,
    12,
    15,
    18,
    21,
    24,
    28,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    27,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    5,
    8,
    11,
    14,
    17,
    20,
    23,
    26,
    1,
    4,
    7,
    10,
    13,
    16,
    19,
    22,
    25
  ];
  int selectedSeatCount = 0;

  List<int> selectedNumbers = [];

  void generateRandomNumbers() {
    final random = Random();

    // 0~8과 27~44의 숫자 목록 생성
    List<int> availableNumbers = [
      for (int i = 0; i < 9; i++) i,
      for (int i = 27; i < 45; i++) i
    ];

    final int numberOfElements = random.nextInt(8) + 3; // 3 to 10 elements
    final Set<int> numberSet = {};

    while (numberSet.length < numberOfElements) {
      numberSet.add(availableNumbers[random.nextInt(availableNumbers.length)]);
    }

    setState(() {
      selectedNumbers = numberSet.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
    // 3 ~ 10 개의 좌석 랜덤 예약
    for (int i = 0; i < selectedNumbers.length; i++) {
      int remove_seat = selectedNumbers[i];
      reservedSeats[remove_seat] = -1;
    }
  }

  @override
  void didUpdateWidget(SeatSelectionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.maxSelectableSeats < selectedSeatCount) {
      setState(() {
        _clearAllSelections();
      });
    }
  }

  void _clearAllSelections() {
    for (int i = 0; i < reservedSeats.length; i++) {
      if (reservedSeats[i] == 1) {
        reservedSeats[i] = 0;
      }
    }
    selectedSeatCount = 0;
  }

  void _toggleSeatSelection(int index) {
    setState(() {
      if (reservedSeats[index] == 0 &&
          selectedSeatCount < widget.maxSelectableSeats) {
        reservedSeats[index] = 1;
        selectedSeatCount++;
      } else if (reservedSeats[index] == 1) {
        reservedSeats[index] = 0;
        selectedSeatCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('출입문', style: TextStyle(fontSize: 20)),
                        Text('좌석\n배치도',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                        Text('운전석', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 9,
                          childAspectRatio: 2.0,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: 45,
                        itemBuilder: (context, index) {
                          if (index != 17 && index >= 9 && index < 27) {
                            return Container(); // 10번~27번까지 빈 컨테이너로 대체
                          }
                          return Seat(
                            seatNumber: seatNo[index],
                            isReserved: reservedSeats[index],
                            onTap: () => _toggleSeatSelection(index),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.alert)
                Positioned.fill(
                  child: Container(
                    color: Colors.white.withOpacity(0.9),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '수량을 선택하시면 좌석을 선택하실 수 있습니다.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '운전기사 뒷자리 탑승자제, 창가 좌석 우선 선택',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '일부 버스의 경우 실제 좌석배치와 다를 수 있습니다.\n할인 승차권의 경우 탑승 시 학생증 소지가 필요합니다.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('빈 좌석: '),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: 50,
                height: 35,
              ),
              const SizedBox(width: 30),
              const Text('선택한 좌석: '),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: primaryBlue,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: 50,
                height: 35,
              ),
              const SizedBox(width: 30),
              const Text('팔린 좌석: '),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: primaryGray,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: 50,
                height: 35,
              ),
              const SizedBox(width: 30),
            ],
          ),
        )
      ],
    );
  }
}

class Seat extends StatelessWidget {
  final int seatNumber;
  final int isReserved;
  final VoidCallback onTap;

  const Seat({
    required this.seatNumber,
    required this.isReserved,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isReserved == 0) {
      seatColor = Colors.white;
    } else if (isReserved == -1) {
      seatColor = Colors.grey;
    } else {
      seatColor = primaryBlue;
    }

    return GestureDetector(
      onTap: isReserved != -1 ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: seatColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            isReserved == -1 ? 'X' : seatNumber.toString(),
            style: TextStyle(
              color: isReserved == -1 ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
