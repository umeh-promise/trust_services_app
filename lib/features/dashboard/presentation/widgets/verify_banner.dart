import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/button.dart';

class VerifyBanner extends StatelessWidget {
  const VerifyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Sizes.md, bottom: Sizes.md, left: Sizes.sm),
      margin: EdgeInsets.symmetric(horizontal: Sizes.md),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppPallete.grey100,
            blurRadius: Sizes.xs,
            offset: Offset(0, 2),
            blurStyle: BlurStyle.solid,
          ),
        ],
        borderRadius: BorderRadius.circular(Sizes.md),
      ),
      child: Row(
        spacing: Sizes.lg,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Sizes.sm,
              children: [
                Text(
                  'Become a verified provider, and reach more clients',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppPallete.primaryColor,
                  ),
                ),
                Button('Verify Now', onPressed: () {}),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: SvgPicture.asset(
              'assets/img/verified.svg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
