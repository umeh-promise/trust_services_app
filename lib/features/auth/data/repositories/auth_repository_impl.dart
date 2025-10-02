import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/exception.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_onboarding_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
    LoginUserParams params,
  ) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailPassword(params);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPasword(
    SignupParams params,
  ) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailPassword(params);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> completeUserOnboarding(
    UserOnboardingParams params,
  ) async {
    try {
      final user = await authRemoteDataSource.completeUserOnboarding(params);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in'));
      }
      return right(user);
    } catch (e) {
      return left(Failure('$e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return right(authRemoteDataSource.logout());
    } catch (e) {
      return left(Failure('$e'));
    }
  }
}
