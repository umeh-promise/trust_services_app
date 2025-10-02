import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPasword(SignupParams params);

  Future<Either<Failure, User>> loginWithEmailPassword(LoginUserParams params);

  Future<Either<Failure, User>> completeUserOnboarding(
    UserOnboardingParams params,
  );

  Future<Either<Failure, User>> currentUser();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword(ForgotPasswordParams params);
}
