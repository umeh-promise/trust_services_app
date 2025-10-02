import 'package:flutter/material.dart';
import 'package:trust_services_app/core/widgets/button.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/dashboard/presentation/pages/home.dart';

class ProfileSuccess extends StatelessWidget {
  const ProfileSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('./assets/img/solid_success.png'),
            ScaffoldTitle('Congratulations'),
            Text(
              'Your profile has been set successfully. click on continue to enjoy the services',
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Button(
              'Continue to Home',
              onPressed: () => Navigator.of(
                context,
              ).pushAndRemoveUntil(HomeScreen.route(), (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
