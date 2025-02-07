import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:login_app/chat_page.dart';
import 'package:login_app/conts.dart';

void main() {
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      home: ChatPage(),
    );
  }
}
