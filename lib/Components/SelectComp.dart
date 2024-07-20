import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

class SelectComp extends StatefulWidget {
  const SelectComp({super.key});

  @override
  State<SelectComp> createState() => _SelectCompState();
}

class _SelectCompState extends State<SelectComp> {
  int adult = 0; // 어른
  int mid = 0; // 중고등학생
  int child = 0; // 어린이
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Component
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 20,
                color: primaryGray,
                child: Text(
                  '어른(\u20A939,300)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                            padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                            foregroundColor: Colors.white,
                            backgroundColor: primaryPurple,
                            shape: RoundedRectangleBorder()),
                        onPressed: () {
                          if (adult != 0) {
                            setState(() {
                              adult--;
                            });
                          }
                        },
                        child: Icon(Icons.remove)),
                    SizedBox(width: 30),
                    Text('$adult'),
                    SizedBox(width: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                            padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                            foregroundColor: Colors.white,
                            backgroundColor: primaryPurple,
                            shape: RoundedRectangleBorder()),
                        onPressed: () {
                          setState(() {
                            adult++;
                          });
                        },
                        child: Icon(Icons.add)),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 20,
                color: primaryGray,
                child: Text(
                  '중고20(\u20A931,400)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                          padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                          foregroundColor: Colors.white,
                          backgroundColor: primaryPurple,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        if (mid != 0) {
                          setState(() {
                            mid--;
                          });
                        }
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(width: 30),
                  Text('$mid'),
                  SizedBox(width: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                          padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                          foregroundColor: Colors.white,
                          backgroundColor: primaryPurple,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        setState(() {
                          mid++;
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 20,
                color: primaryGray,
                child: Text(
                  '아동50(\u20A919,700)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                          padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                          foregroundColor: Colors.white,
                          backgroundColor: primaryPurple,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        if (child != 0) {
                          setState(() {
                            child--;
                          });
                        }
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(width: 30),
                  Text('$child'),
                  SizedBox(width: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(30, 30), // 너비와 높이를 동일하게 설정하여 정사각형 모양 만들기
                          padding: EdgeInsets.all(0), // 내부 패딩을 제거하여 정사각형 유지
                          foregroundColor: Colors.white,
                          backgroundColor: primaryPurple,
                          shape: RoundedRectangleBorder()),
                      onPressed: () {
                        setState(() {
                          child++;
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonComp extends StatelessWidget {
  const ButtonComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
    );
  }
}
