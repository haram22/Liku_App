import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

class SelectComp extends StatefulWidget {
  final Function(int adult, int mid, int child) onCountChanged;
  final int leftSeats;
  const SelectComp({super.key, required this.onCountChanged, required this.leftSeats});

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
                              widget.onCountChanged(-1, 0, 0);
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
                          if(adult + mid + child <= widget.leftSeats){
                            setState(() {
                              adult++;
                              widget.onCountChanged(1, 0, 0);
                            });
                          }
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
                            widget.onCountChanged(0, -1, 0);
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
                        if(adult + mid + child <= widget.leftSeats){
                          setState(() {
                            mid++;
                            widget.onCountChanged(0, 1, 0);
                          });
                        }
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
                            widget.onCountChanged(0, 0, -1);
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
                        if(adult + mid + child <= widget.leftSeats){
                          setState(() {
                            child++;
                            widget.onCountChanged(0, 0, 1);
                          });
                        }
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
  final int page;
  final int totalItems;
  final int itemsPerPage;
  final int pass;
  final ValueChanged<int> onPageChanged;

  const ButtonComp({
    super.key,
    required this.page,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged, 
    required this.pass,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            foregroundColor: Colors.white,
          ),
          onPressed: page > 0
              ? () {
                  onPageChanged(page - pass);
                }
              : null,
          child: const Text(
            '< 이전',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            foregroundColor: Colors.white,
          ),
          onPressed: (page + pass) * itemsPerPage < totalItems
              ? () {
                  onPageChanged(page + pass);
                }
              : null,
          child: const Text(
            '이후 >',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width - 20, size.height / 2);
    path.lineTo(size.width + 20, size.height / 2);
    path.moveTo(size.width + 20, size.height / 2);
    path.lineTo(size.width + 12, size.height / 2 - 5);
    path.moveTo(size.width + 20, size.height / 2);
    path.lineTo(size.width + 12, size.height / 2 + 5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
