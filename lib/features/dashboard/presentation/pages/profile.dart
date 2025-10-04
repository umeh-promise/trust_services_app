import 'package:flutter/material.dart';
import 'package:trust_services_app/core/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static route(Function() onPrevious) => MaterialPageRoute(
    builder: (ctx) => ProfileScreen(onPrevious: onPrevious),
  );

  final void Function() onPrevious;
  const ProfileScreen({super.key, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Profile', onTap: onPrevious),
      body: Center(child: Text('Profile')),
    );
  }
}
