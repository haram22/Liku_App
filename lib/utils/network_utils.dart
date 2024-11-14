import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  //static const String _url = 'http://20.41.118.19:8000'; // Azure 서버
  //static const String _url = 'http://127.0.0.1:8000'; //  Local 서버
  static const String _url = 'http://172.18.135.56:8000'; // 무선LAN 서버

  static OverlayEntry? _currentOverlayEntry;
  static String _currentText = "";

  static Future<String> fetchScenario() async {
    final response = await http.get(Uri.parse('$_url/scenario'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      String scenario = data['scenario'];

      // 줄바꿈을 " / "로 연결하면서 마지막에 " / "가 붙지 않도록 처리
      scenario = scenario.trim().split('\n').join(' / ').replaceAll('\r', '');
      return scenario;
    } else {
      throw Exception('Failed to load scenario');
    }
  }

  static Future<String> sendMessageToServer(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$_url/chat'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'content': message,
        }),
      );

      if (response.statusCode == 200) {
        // 서버에서 받은 응답을 그대로 반환 (String 처리)
        String responseMessage = utf8.decode(response.bodyBytes);
        responseMessage = responseMessage.replaceAll(r'\', '');
        return responseMessage;
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static void showOverlayMessage(BuildContext context, String message) {
    final overlay = Overlay.of(context);

    // Remove existing overlay if it exists
    if (_currentOverlayEntry != null) {
      _currentOverlayEntry!.remove();
      _currentOverlayEntry = null; // Overlay 초기화
    }

    _currentText = "";
    // Create a new OverlayEntry
    _currentOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 0.0,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(1),
            ),
            child: Text(
              _currentText,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    // Insert the new overlay entry
    overlay.insert(_currentOverlayEntry!);

    // Reset currentText and start adding characters one by one
    _currentText = "";
    _addCharactersOneByOne(message, context);
  }

  static Future<void> _addCharactersOneByOne(
      String message, BuildContext context) async {
    _currentText = "";
    for (int i = 0; i < message.length; i++) {
      // Add one character at a time to _currentText
      _currentText += message[i];

      // Rebuild the overlay to show the updated text
      if (_currentOverlayEntry != null) {
        _currentOverlayEntry!.markNeedsBuild();
      }

      // Wait before adding the next character (50 ms interval)
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  static Future<void> sendMessageAndShowResponse(
      BuildContext context, String message) async {
    try {
      // 서버로 메시지 전송
      String responseMessage = await sendMessageToServer(message);
      // 서버로부터 받은 응답을 Overlay로 띄우기
      showOverlayMessage(context, responseMessage);
    } catch (e) {
      // 오류가 발생하면 오류 메시지 띄우기
      // showOverlayMessage(context, "$e");
    }
  }
}
