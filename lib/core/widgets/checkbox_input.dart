import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class CheckboxInput extends StatelessWidget {
  final String label;
  final bool checkedState;
  final ValueChanged onChange;
  const CheckboxInput(
    this.label, {
    super.key,
    required this.checkedState,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: checkedState,
          onChanged: onChange,
          activeColor: AppPallete.primaryColor,
          side: BorderSide(
            width: 3,
            color: AppPallete.primaryColor,
            strokeAlign: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
