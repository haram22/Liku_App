import 'package:liku/Components/global.dart';

class Schedule {
  final String time;
  final String destStation;
  final String form;
  final String grade;
  final String company;
  final String duration;
  final String state;
  final int leftSeat;
  final int totalSeat;

  Schedule(
      {required this.time,
      required this.destStation,
      required this.form,
      required this.grade,
      required this.company,
      required this.duration,
      required this.state,
      required this.leftSeat,
      required this.totalSeat});
}

List<Schedule> createSampleData() {
  return [
    Schedule(
        time: '10:50',
        destStation: destNotifier.value,
        form: '직행',
        grade: '프리미엄',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '12:40',
        destStation: destNotifier.value,
        form: '직행',
        grade: '우등',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '14:10',
        destStation: destNotifier.value,
        form: '직행',
        grade: '프리미엄',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '17:00',
        destStation: destNotifier.value,
        form: '직행',
        grade: '우등',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '18:30',
        destStation: destNotifier.value,
        form: '직행',
        grade: '프리미엄',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '19:30',
        destStation: destNotifier.value,
        form: '직행',
        grade: '우등',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '23:55',
        destStation: destNotifier.value,
        form: '직행',
        grade: '프리미엄',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
    Schedule(
        time: '23:59',
        destStation: destNotifier.value,
        form: '직행',
        grade: '우등',
        company: '금호고속',
        duration: '04:50',
        state: '정기',
        leftSeat: 18,
        totalSeat: 28),
  ];
}
