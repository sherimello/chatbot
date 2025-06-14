class ChatMessage {
  final String text;
  final bool isUserMessage;
  final bool isError;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
    required this.isError
  });
}