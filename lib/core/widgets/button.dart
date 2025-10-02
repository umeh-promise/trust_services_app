import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isProcessing;
  final bool isInvalid;

  const Button(
    this.buttonText, {
    super.key,
    required this.onPressed,
    this.isInvalid = false,
    this.isProcessing = false,
    this.backgroundColor = AppPallete.primaryColor,
    this.color = AppPallete.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isInvalid || isProcessing ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: AppPallete.secondaryColor,
        ),
        icon: isProcessing
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppPallete.whiteColor,
                  strokeWidth: 3,
                ),
              )
            : null,
        label: Text(
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
