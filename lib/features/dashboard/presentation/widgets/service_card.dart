import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/line_divider.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final String icon;

  const ServiceCard({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: Sizes.xs, right: Sizes.sm),

        child: Container(
          padding: const EdgeInsets.all(Sizes.sm),
          width: 240,
          decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppPallete.grey500),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Image.asset(
                icon,
                height: 118,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextTheme.of(
                      context,
                    ).labelSmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset('assets/img/verified.svg', width: 18),
                ],
              ),
              Row(
                spacing: 2,
                children: [
                  SvgPicture.asset('assets/img/star.svg'),
                  RichText(
                    text: TextSpan(
                      text: "4.5 ",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppPallete.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '(24 Reviews)',
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppPallete.secondaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),
              LineDivider(),
              SizedBox(height: 1),
              Button('View Details', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
