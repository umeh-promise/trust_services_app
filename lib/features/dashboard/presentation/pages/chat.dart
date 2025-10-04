import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/custom_app_bar.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/chart_card.dart';

final conversations = [
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chima Charles',
    "time": '9:30am',
    "message": "hi, hope you are still up for the job?...",
  },
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chisom James',
    "time": '9:32am',
    "message": "hi, hope you are still up for the job?...",
  },
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chinonso Annon',
    "time": '10:00am',
    "message": "hi, hope you are still up for the job?...",
  },
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chima Charles',
    "time": '9:30am',
    "message": "hi, hope you are still up for the job?...",
  },
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chisom James',
    "time": '9:32am',
    "message": "hi, hope you are still up for the job?...",
  },
  {
    'image': 'assets/img/avatar.png',
    'name': 'Chinonso Annon',
    "time": '10:00am',
    "message": "hi, hope you are still up for the job?...",
  },
];

class ChatScreen extends StatelessWidget {
  static route(Function() onPrevious) =>
      MaterialPageRoute(builder: (ctx) => ChatScreen(onPrevious: onPrevious));

  final void Function() onPrevious;
  const ChatScreen({super.key, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Chat', onTap: onPrevious),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.base),
        child: ListView.separated(
          itemCount: conversations.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => ChartCard(
            key: ValueKey(index),
            name: conversations[index]['name'] as String,
            time: conversations[index]['time'] as String,
            message: conversations[index]['message'] as String,
            image: conversations[index]['image'] as String,
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(height: Sizes.md),
        ),
      ),
    );
  }
}
