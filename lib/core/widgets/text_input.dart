import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

enum TextInputTypes {
  text,
  phone,
  number,
  numberWithOptions,
  email,
  multiline,
  datetime,
}

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hintText;
  final bool obscureText;
  final int? maxLines;
  final TextInputTypes type;

  const TextInput({
    super.key,
    this.label,
    this.maxLines = 1,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.type = TextInputTypes.text,
  });

  TextInputType _mapKeyboardType(TextInputTypes type) {
    switch (type) {
      case TextInputTypes.phone:
        return TextInputType.phone;
      case TextInputTypes.number:
        return TextInputType.number;
      case TextInputTypes.numberWithOptions:
        return const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        );
      case TextInputTypes.email:
        return TextInputType.emailAddress;
      case TextInputTypes.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (label != null)
          Text(
            label!,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppPallete.grey500),
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          maxLines: maxLines,
          keyboardType: _mapKeyboardType(type),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
          validator: label != null
              ? (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '$label cannot be empty';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
