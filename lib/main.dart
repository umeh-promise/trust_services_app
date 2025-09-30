import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/theme.dart';
import 'package:trust_services_app/features/home/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
