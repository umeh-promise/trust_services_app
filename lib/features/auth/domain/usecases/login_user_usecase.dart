import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUserUsecase extends Usecase<User, LoginUserParams> {
  final AuthRepository authRepository;

  LoginUserUsecase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(LoginUserParams params) async {
    return await authRepository.loginWithEmailPassword(params);
  }
}

class LoginUserParams {
  final String email;
  final String password;

  LoginUserParams({required this.email, required this.password});
}
