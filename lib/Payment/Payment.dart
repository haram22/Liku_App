import 'package:flutter/material.dart';
import 'package:liku/Theme/Colors.dart';
import '../Components/TopBottomComp.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const Headercomp(text: '카드를 인식시켜주세요'),
      body: Row(
        children: [
          Flexible(
            flex: 8,
            child: Column(
              children: [
                Container(
                  color: primaryPurple,
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(text: "카드 결제", style: TextStyle(fontSize: 40))
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "결제하실 카드",
                            style: TextStyle(
                                fontSize: 35,
                                color: primaryRed,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "를 리더기에 삽입해주세요.",
                            style: TextStyle(
                                fontSize: 35,
                                color: primaryBlack,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryGray, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth / 1.5,
                  height: 70,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "일부 직불카드 및 선불형 카드",
                            style:
                                TextStyle(color: primaryBlack, fontSize: 25)),
                        TextSpan(
                            text: "의 사용이 ",
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 25)),
                        TextSpan(
                            text: "불가능",
                            style:
                                TextStyle(color: primaryBlack, fontSize: 25)),
                        TextSpan(
                            text: "할 수 있으므로 이용시 참고바랍니다.",
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 25))
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomComp(),
    );
  }
}
