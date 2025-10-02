import 'package:flutter/material.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/connect.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/profile_success.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/services.dart';
import 'package:trust_services_app/features/auth/presentation/widgets/welcome.dart';

class OnboardingFlow extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (ctx) => OnboardingFlow());
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          children: [
            WelcomeScreen(onNextPage: _nextPage),
            ServicesScreen(onNextPage: _nextPage, onPrevPage: _prevPage),
            ConnectScreen(onNextPage: _nextPage, onPrevPage: _prevPage),
            ProfileSuccess(),
          ],
        ),
      ),
    );
  }
}
