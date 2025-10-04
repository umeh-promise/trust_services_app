import 'package:flutter/material.dart';
import 'package:trust_services_app/core/widgets/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  static route(Function() onPrevious) =>
      MaterialPageRoute(builder: (ctx) => ChatScreen(onPrevious: onPrevious));

  final void Function() onPrevious;
  const ChatScreen({super.key, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Chat', onTap: onPrevious),
      body: Center(child: Text('Chat')),
    );
  }
}
