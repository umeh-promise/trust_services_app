import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        spacing: 10,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppPallete.grey100,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppPallete.grey200),
            ),
            child: Icon(icon, color: AppPallete.primaryColor),
          ),
          Text(title, style: TextTheme.of(context).bodyLarge),
          Spacer(),
          Icon(
            Icons.chevron_right,
            size: 24,
            weight: 2,
            color: AppPallete.grey500,
          ),
        ],
      ),
    );
  }
}
