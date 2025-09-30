import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String buttonText;
  final VoidCallback onPressed;

  const Button(
    this.buttonText, {
    super.key,
    required this.onPressed,
    this.backgroundColor = AppPallete.primaryColor,
    this.color = AppPallete.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
