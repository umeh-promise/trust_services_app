import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/widgets/heading.dart';

class HomeHeading extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HomeHeading({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Heading(title),
        TextButton.icon(
          onPressed: onPressed,
          label: Text(
            'View all',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppPallete.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(
            Icons.chevron_right,
            size: 24,
            weight: 2,
            color: AppPallete.primaryColor,
          ),
          iconAlignment: IconAlignment.end,
        ),
      ],
    );
  }
}
