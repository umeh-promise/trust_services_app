import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/features/home/presentation/widgets/carousel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            './assets/img/repairmen.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            color: AppPallete.bgOverlayColor,
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 18,
              right: 24,
              bottom: 72,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 16,
              children: [
                Carousel(),
                Button('Get Started', onPressed: () {}),
                Button(
                  'Login Now',
                  onPressed: () {},
                  backgroundColor: AppPallete.whiteColor,
                  color: AppPallete.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
