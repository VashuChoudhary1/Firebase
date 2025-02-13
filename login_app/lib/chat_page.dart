import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'dart:convert';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(id: '0', firstName: "User");
  ChatUser geminiUser = ChatUser(id: '1', firstName: "Gemini");
  List<ChatMessage> messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Chat Bot",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages]; // Display user message immediately
    });

    try {
      String question = chatMessage.text;

      StringBuffer responseBuffer =
          StringBuffer(); // Buffer to collect streamed parts

      gemini.streamGenerateContent(question).listen(
        (event) {
          // Add each part to the buffer
          String partText =
              jsonDecode(jsonEncode(event.content?.parts?.first))['text'] ?? "";
          responseBuffer
              .write("${partText.trim()} "); // Append part and add space
        },
        onDone: () {
          // Once the stream is done, update the UI with the full response
          String finalResponse = responseBuffer.toString().trim();

          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: finalResponse,
          );

          setState(() {
            messages = [message, ...messages]; // Add full response to the chat
          });
        },
        onError: (error) {
          print("Error: $error");
        },
      );
    } catch (e) {
      print("Exception: $e");
    }
  }
}
