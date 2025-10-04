import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';

class ChartCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String image;
  const ChartCard({
    super.key,
    required this.name,
    required this.time,
    required this.message,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        spacing: Sizes.base,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppPallete.secondaryColor,
              borderRadius: BorderRadius.circular(50),
            ),

            child: Image.asset(
              'assets/img/avatar.png',
              fit: BoxFit.cover,
              alignment: AlignmentGeometry.topCenter,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(message),
              ],
            ),
          ),
          Column(
            spacing: 4,
            children: [
              Text(time),
              Container(
                width: 25,
                height: 25,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppPallete.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppPallete.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
