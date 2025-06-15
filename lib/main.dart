import 'dart:convert';

import 'package:chatbot/network/gemini_chat_service.dart';
import 'package:chatbot/pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = "...";

  dynamic testAPI() async {
    var url = "https://jsonplaceholder.typicode.com/todos/1";
    var response = await http.get(Uri.parse(url));

    var jsonResponse = jsonDecode(response.body);
    var title = jsonResponse["title"];
    var userId = jsonResponse["userId"];
    var id = jsonResponse["id"];
    var completed = jsonResponse["completed"];

    return completed.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(geminiChatService: GeminiChatService(apiKey: "YOUR_API_KEY", modelName: 'gemini-2.0-flash'),),
      // home: Scaffold(
      //   body: SafeArea(
      //     child: Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         spacing: 21,
      //         children: [
      //           Text(data),
      //           ElevatedButton(
      //             onPressed: () async {
      //               data = await GeminiChatService(apiKey: '...', modelName: 'gemini-2.0-flash').sendMessage("hello there!");
      //
      //               setState(() {
      //                 data = data;
      //               });
      //             },
      //             child: Text("Test API"),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
