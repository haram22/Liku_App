import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liku/Components/global.dart';
import 'package:liku/Theme/Colors.dart';

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

      final VoidCallback? buttonAction = isButtonEnabled ? () {
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
        seatNotifier.value.sort();
        Navigator.pushReplacementNamed(context, '/checkTicket');
      } : null;

      return Container(
        width: 140,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: isButtonEnabled
                ? primaryOrange
                : Colors.grey,
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
            InfoContainer(title: "도착지선택", content: destNotifier.value, color: subPurple),
            SizedBox(height: 2),
            InfoContainer(
                title: "출발일선택", content: DateFormat('yyyy-MM-dd').format(DateTime.now()), color: subPurple),
            SizedBox(height: 2),
            InfoContainer(title: "출발시간선택", content: timeNotifier.value, color: subPurple)
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
