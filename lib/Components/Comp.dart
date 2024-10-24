import 'dart:math';

import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liku/Components/global.dart';
import 'package:liku/Theme/Colors.dart';
import 'package:liku/utils/network_utils.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final int? selectedSeatCount;
  final int? maxSelectableSeats;

  const OrangeButton({
    super.key,
    required this.text,
    this.selectedSeatCount,
    this.maxSelectableSeats,
  });

  @override
  Widget build(BuildContext context) {
    String _info = '';

    if (text == '선택완료') {
      final bool isButtonEnabled = (selectedSeatCount != null &&
          maxSelectableSeats != null &&
          selectedSeatCount == maxSelectableSeats &&
          maxSelectableSeats! > 0);

      final VoidCallback? buttonAction = isButtonEnabled
          ? () {
              if (globalAdult.value > 0) {
                _info += '어른(${globalAdult.value})';
              }
              if (globalMid.value > 0) {
                if (_info.isNotEmpty) _info += ', ';
                _info += '중고생(${globalMid.value})';
              }
              if (globalChild.value > 0) {
                if (_info.isNotEmpty) _info += ', ';
                _info += '아동(${globalChild.value})';
              }
              globalInfo.value = _info;
              globalPerson.value = _info;
              seatNotifier.value.sort();
              NetworkUtils.sendMessageToServer(
                  "사용자는 좌석 선택 화면에서 $_info를 선택하고 [선택 완료] 버튼을 눌렀습니다. 결제 화면으로 넘어갑니다.");
              Navigator.pushReplacementNamed(context, '/checkTicket');
            }
          : null;

      return Container(
        width: 140,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: isButtonEnabled ? primaryOrange : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: buttonAction,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (text == '카드결제') {
      return Container(
        width: 140,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: primaryOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            NetworkUtils.sendMessageToServer(
                "사용자는 결제 화면에서 [카드결제] 버튼을 눌렀습니다. 종합적으로 사용자는 ${globalDest.value}로 가는 ${globalTime.value} 버스를 선택해 ${globalPerson.value}을 예매했습니다. 시나리오와 비교해주세요. 끝화면으로 넘어갑니다.");
            Navigator.pushReplacementNamed(context, '/payment');
          },
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    // 기본적으로 아무것도 안하는 경우 빈 위젯 반환
    return SizedBox.shrink();
  }
}

class ShowInfo extends StatelessWidget {
  const ShowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryPurple,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            InfoContainer(title: "출발터미널", content: "동서울", color: primaryBlack),
            SizedBox(height: 2),
            InfoContainer(
                title: "도착지선택", content: destNotifier.value, color: subPurple),
            SizedBox(height: 2),
            InfoContainer(
                title: "출발일선택",
                content: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                color: subPurple),
            SizedBox(height: 2),
            InfoContainer(
                title: "출발시간선택", content: timeNotifier.value, color: subPurple)
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  const InfoContainer(
      {Key? key,
      required this.title,
      required this.content,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              color: color,
              width: double.infinity,
              height: 50,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            content,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

class FinalResult extends StatelessWidget {
  final String title;
  final String data;
  const FinalResult({Key? key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: 150,
              height: 30,
              color: Colors.blue[50],
              child: Text(title)),
          SizedBox(height: 5),
          Text(data)
        ],
      ),
    );
  }
}

class TicketResults extends StatelessWidget {
  final String title;
  final String content;
  final double width;
  const TicketResults(
      {Key? key,
      required this.title,
      required this.content,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.blue[50],
            width: width,
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[500], fontSize: 17),
            ),
          ),
          SizedBox(width: 10),
          Text(
            content,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class CommonFloatingButton extends StatefulWidget {
  final String screenName;
  const CommonFloatingButton({Key? key, required this.screenName})
      : super(key: key);

  @override
  State<CommonFloatingButton> createState() => _CommonFloatingButtonState();
}

class _CommonFloatingButtonState extends State<CommonFloatingButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButtonLocation.endDocked;
    return FloatingActionBubble(
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "여기서 무슨 버튼을 눌러야 하나요?",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.question_answer,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            NetworkUtils.sendMessageToServer(
                "${widget.screenName} 여기서 무슨 버튼을 눌러야 하나요?");
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "잘못 눌렀습니다. 어떻게 되돌아 가나요?",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.question_answer,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            NetworkUtils.sendMessageToServer("잘못 눌렀습니다. 어떻게 되돌아 가나요?");
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: "잘 못 들었습니다. 다시한번 들려주세요.",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.question_answer,
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            //NetworkUtils.sendMessageToServer("잘 못 들었습니다. 다시한번 들려주세요.");
            NetworkUtils.sendMessageToServer(
                "${widget.screenName} 화면인데, 잘 못 들었습니다. 다시한번 들려주세요.");
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: Colors.white,

      // Flaoting Action button Icon
      iconData: Icons.question_mark_rounded,
      backGroundColor: Colors.blue,
    );
  }
}
