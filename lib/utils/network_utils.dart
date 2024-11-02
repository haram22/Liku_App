import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static const String _url = 'http://20.41.118.19:8000/chat'; // Azure 서버
  //static const String _url = 'http://127.0.0.1:8000/chat'; //  Local 서버
  //static const String _url = 'http://172.18.135.56:8000/chat'; // 무선LAN 서버

  static Future<void> sendMessageToServer(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'content': message, // 서버로 보낼 메시지
        }),
      );

      if (response.statusCode == 200) {
        // 서버가 성공적으로 응답했을 때 처리할 내용
        print('Message sent successfully: ${response.body}');
      } else {
        // 서버 오류 처리
        print('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
