import 'package:flutter/material.dart';

class AppSubHeading extends StatelessWidget {
  final String subHeading;
  const AppSubHeading(this.subHeading, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(subHeading, style: Theme.of(context).textTheme.labelSmall);
  }
}
