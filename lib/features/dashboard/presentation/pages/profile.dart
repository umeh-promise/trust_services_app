import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => ProfileScreen());
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Profile')));
  }
}
