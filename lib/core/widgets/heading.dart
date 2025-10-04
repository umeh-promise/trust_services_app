import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(color: AppPallete.grey500),
    );
  }
}
