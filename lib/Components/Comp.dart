import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

class OrangeButton extends StatelessWidget {
  final String text;

  const OrangeButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // 여기에 원하는 radius 값을 설정하세요
          ),
        ),
        onPressed: () {
          print("button pressed");
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class ShowInfo extends StatelessWidget {
  const ShowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryPurple,
      height: 290,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            InfoContainer(title: "출발터미널", content: "동서울", color: primaryBlack),
            SizedBox(height: 2),
            InfoContainer(title: "도착지선택", content: "-", color: subPurple),
            SizedBox(height: 2),
            InfoContainer(
                title: "출발일선택", content: "2022-11-25", color: subPurple),
            SizedBox(height: 2),
            InfoContainer(title: "출발시간선택", content: "10:33", color: subPurple)
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
      height: 70,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              color: color,
              width: 100,
              height: 30,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(content)
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
      height: 30,
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
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          SizedBox(width: 10),
          Text(
            content,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
