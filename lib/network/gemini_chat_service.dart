import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiChatService{
  final String apiKey;
  final String modelName;

  GeminiChatService({required this.apiKey, required this.modelName});

  dynamic sendMessage(String text) async {
    if(text.trim().isEmpty) {
      return;
    }
    final url = "https://generativelanguage.googleapis.com/v1beta/models/$modelName:generateContent?key=$apiKey";

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {
              "text": text
            }
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json"
        },
          body: jsonEncode(requestBody)
      );

      var data = jsonDecode(response.body)["candidates"][0]["content"]["parts"][0]["text"];

      print(data);
      return data;

    }
    catch (e) {
      print("Error: $e");
    }

  }

}