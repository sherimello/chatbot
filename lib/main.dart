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
  String data = "";

  dynamic testAPI() async {
    var url = "https://jsonplaceholder.typicode.com/todos/1";

    var response = await http.get(Uri.parse(url));

    var title = jsonDecode(response.body)["title"];

    return title;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(chatService: GeminiChatService(modelName: "gemini-2.0-flash", apiKey: "AIzaSyBGtrSBQ6yd0IrvC8yxqu0O9pkb9O_6p5w")),
      // home: Scaffold(
      //   body: Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       spacing: 21,
      //       children: [
      //         Text(data),
      //         ElevatedButton(
      //           onPressed: () async {
      //
      //            GeminiChatService(modelName: "gemini-2.0-flash", apiKey: "AIzaSyBGtrSBQ6yd0IrvC8yxqu0O9pkb9O_6p5w")
      //                .sendMessage("hello there!");
      //
      //             // data = await testAPI();
      //             // setState(() {
      //             //   data = data;
      //             // });
      //           },
      //           child: Text("Test API"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

//