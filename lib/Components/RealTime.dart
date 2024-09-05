import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RealTimeClock extends StatefulWidget {
  @override
  _RealTimeClockState createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  late String _currentDate;
  late String _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _updateDateTime();
      });
    });
  }

  void _updateDateTime() {
    final DateTime now = DateTime.now();
    _currentDate = DateFormat('yyyy-MM-dd').format(now);
    _currentTime = DateFormat('HH:mm:ss').format(now);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentDate,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          _currentTime,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  
  }
}