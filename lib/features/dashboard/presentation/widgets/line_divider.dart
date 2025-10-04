import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppPallete.grey200)),
      ),
    );
  }
}
