import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/theme/theme.dart';
import 'package:trust_services_app/core/utils/app_router.dart';
import 'package:trust_services_app/core/widgets/loader.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/onboarding_cubit.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/dashboard_tabs.dart';
import 'package:trust_services_app/features/home/presentation/pages/splash.dart';
import 'package:trust_services_app/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AuthCubit>()),
        BlocProvider(create: (_) => serviceLocator<OnboardingCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
      navigatorKey: AppRouter.navigatorKey,
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) return Loader();
          if (state is AuthSuccess) return DashboardTabs();
          return SplashScreen();
        },
      ),
    );
  }
}
