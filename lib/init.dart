import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trust_services_app/core/secrets/secrets.dart';
import 'package:trust_services_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:trust_services_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:trust_services_app/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/onboarding_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initOnboarding();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseApiKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory(() => UserSignupUsecase(serviceLocator()))
    ..registerFactory(() => CurrentUserUsecase(serviceLocator()))
    ..registerFactory(() => LoginUserUsecase(serviceLocator()))
    ..registerFactory(() => LogoutUsecase(serviceLocator()))
    ..registerLazySingleton(
      () => AuthCubit(
        signupUsecase: serviceLocator(),
        currentUserUsecase: serviceLocator(),
        loginUserUsecase: serviceLocator(),
        logoutUsecase: serviceLocator(),
      )..authLoggedInUser(),
    );
}

void _initOnboarding() {
  serviceLocator
    ..registerFactory(() => UserOnboardingUsecase(serviceLocator()))
    ..registerLazySingleton(
      () => OnboardingCubit(userOnboardingUsecase: serviceLocator()),
    );
}
