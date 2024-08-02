import 'package:flutter/material.dart';
import 'package:liku/Components/TopBottomComp.dart';
import 'package:liku/Components/SelectComp.dart';
import 'package:liku/SelectTime/SelectTime.dart';
import 'CheckTicket/CheckTicket.dart';
import 'Components/Comp.dart';
import 'Components/GridComp.dart';
import 'Home/Home.dart';
import 'Payment/Payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Checkticket(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '동서울 터미널 무인발매기 입니다.'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OrangeButton(text: "text"),
              ShowInfo(),
              FinalResult(title: "총 수량", data: "10"),
              TicketResults(title: "출발지", content: "동서울", width: 100),
              Container(
                  alignment: Alignment.center,
                  width: 400,
                  height: 72,
                  child: TextWordView()),
              SizedBox(height: 5),
              Container(
                  alignment: Alignment.center,
                  width: 450,
                  height: 82,
                  child: LocationContainer()),
              ButtonComp()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomComp(),
    );
  }
}
