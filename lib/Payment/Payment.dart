import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';

import '../Components/Comp.dart';
import '../Components/TopBottomComp.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  int select = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Headercomp(text: '티켓 수량과 좌석을 선택하세요.'),
      body: Row(
        children: [
          const Flexible(flex: 2, child: ShowInfo()),
          Flexible(
            flex: 8,
            child: Column(
              children: [
                Container(
                  color: primaryBlack,
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "티켓 내역 확인하기", style: TextStyle(fontSize: 40))
                      ]),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 5,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
