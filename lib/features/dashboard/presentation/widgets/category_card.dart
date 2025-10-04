import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final int available;
  final String icon;

  const CategoryCard({
    super.key,
    required this.name,
    required this.available,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        surfaceTintColor: AppPallete.whiteColor,
        color: AppPallete.grey50,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.xs,
            horizontal: Sizes.sm,
          ),
          child: Row(
            spacing: Sizes.base,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(Sizes.sm),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppPallete.whiteColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SvgPicture.asset(icon, width: Sizes.xs),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$available Available',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppPallete.primaryColor,
                    ),
                  ),
                ],
              ),

              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
