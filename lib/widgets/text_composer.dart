import 'package:flutter/material.dart';

class TextComposer extends StatelessWidget {
  final TextEditingController textController;
  final bool isLoading;
  final Function(String) handleMessages;
  const TextComposer({super.key, required this.textController, required this.isLoading, required this.handleMessages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19),
      color: Colors.black,
      child: Row(
        children: [
          Flexible(child: TextField(
            controller: textController,
            onSubmitted: isLoading ? null : handleMessages,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "what's on your mind...?",
              helperStyle: TextStyle(
                color: Colors.white54, fontSize: 14
              ),
            ),
            style: TextStyle(
              color: Colors.white, fontSize: 14
            ),
          )),
          GestureDetector(
              onTap: () {
                isLoading ? null : handleMessages(textController.text);
              },
              child: Icon(Icons.send_outlined, color: Colors.white,)),
        ],
      ),
    );
  }
}
