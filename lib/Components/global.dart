import 'package:flutter/material.dart';

// 전역적으로 사용할 ValueNotifier 선언
final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
final ValueNotifier<String> destNotifier = ValueNotifier<String>('-');
final ValueNotifier<String> timeNotifier = ValueNotifier<String>('-');

final ValueNotifier<int> globalAdult = ValueNotifier<int>(0);
final ValueNotifier<int> globalMid = ValueNotifier<int>(0);
final ValueNotifier<int> globalChild = ValueNotifier<int>(0);
final ValueNotifier<String> globalFee = ValueNotifier<String>('');
final ValueNotifier<String> globalInfo = ValueNotifier<String>('');
final ValueNotifier<List> seatNotifier = ValueNotifier<List>([]);

