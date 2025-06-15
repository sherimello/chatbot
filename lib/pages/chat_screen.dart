import 'package:chatbot/models/chat_message.dart';
import 'package:chatbot/widgets/message_bubble.dart';
import 'package:chatbot/widgets/text_composer.dart';
import 'package:flutter/material.dart';

import '../network/gemini_chat_service.dart';

class ChatScreen extends StatefulWidget {
  final GeminiChatService chatService;

  const ChatScreen({super.key, required this.chatService});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  Future<void> _handleSentMessages(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = ChatMessage(
      text: text,
      isUserMessage: true,
      isError: false,
    );

    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
    });
    _textController.clear();
    _scrollToBottom();

    try {
      final response = await widget.chatService.sendMessage(text);
      final botMessage = ChatMessage(
        text: response,
        isUserMessage: false,
        isError: false,
      );

      setState(() {
        _messages.add(botMessage);
        _isLoading = false;
      });

    }
    catch(e) {
      print("Error: $e");
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.hasContentDimensions) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: _messages.length,
              controller: _scrollController,
              padding: EdgeInsets.all(19),
              itemBuilder: (context, index) {

              final message = _messages[index];
            return MessageBubble(message: message);
          })),
          if(_isLoading)
            CircularProgressIndicator(),
          TextComposer(textController: _textController, isLoading: _isLoading, handleMessages: _handleSentMessages)
        ],
      )),
    );
  }
}

//