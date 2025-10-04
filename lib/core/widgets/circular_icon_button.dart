import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const CircularIconButton(this.icon, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppPallete.grey100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 30, color: AppPallete.primaryColor),
      ),
    );
  }
}
