import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class ScaffoldTitle extends StatelessWidget {
  final String title;
  const ScaffoldTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: AppPallete.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
