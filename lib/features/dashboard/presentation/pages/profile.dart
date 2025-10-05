import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/custom_app_bar.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static route(Function() onPrevious) => MaterialPageRoute(
    builder: (ctx) => ProfileScreen(onPrevious: onPrevious),
  );

  final void Function() onPrevious;
  const ProfileScreen({super.key, required this.onPrevious});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Profile', onTap: onPrevious),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.base),
        child: Column(
          spacing: Sizes.base,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: Sizes.base,
              children: [
                Stack(
                  alignment: AlignmentGeometry.bottomRight,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppPallete.whiteColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: AppPallete.grey300,
                          ),
                        ),
                        child: Icon(
                          CupertinoIcons.photo_camera,
                          size: 16,
                          color: AppPallete.grey300,
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dave Promise',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('Lagos, Nigeria'),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 2),
            ProfileCard(
              title: 'Subscribe for more visibility',
              icon: Icons.monetization_on_outlined,
            ),
            ProfileCard(title: 'Set up Service', icon: Icons.verified_user),
            Divider(),
            ProfileCard(title: 'Change password', icon: Icons.key),
            ProfileCard(
              title: 'Edit profile details',
              icon: CupertinoIcons.person,
            ),
            Divider(),
            TextButton.icon(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),
              ),
              onPressed: () => context.read<AuthCubit>().logout(),
              icon: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppPallete.grey100,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: AppPallete.grey200),
                ),
                child: Icon((Icons.logout), color: AppPallete.redColor),
              ),
              label: Text(
                'Logout',
                style: TextTheme.of(context).bodyLarge!.copyWith(
                  color: AppPallete.redColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
