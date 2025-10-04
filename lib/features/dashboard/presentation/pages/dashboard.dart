import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/app_sub_heading.dart';
import 'package:trust_services_app/core/widgets/circular_icon_button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/categories.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/line_divider.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/search_bar.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/services.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/verify_banner.dart';

class DashboardScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => DashboardScreen());
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Sizes.sm,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.base),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: Sizes.base,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ScaffoldTitle('Welcome, Ben'),
                                  AppSubHeading('Awka, Amansea'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        spacing: Sizes.xs,
                        children: [
                          CircularIconButton(
                            Icons.location_on_outlined,
                            onPressed: () {},
                          ),
                          CircularIconButton(
                            CupertinoIcons.bell_solid,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                LineDivider(),
                SearchBarWithIcon(),
                VerifyBanner(),
                Categories(),
                Services(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
