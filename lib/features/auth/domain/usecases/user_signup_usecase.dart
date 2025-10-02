import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class UserSignupUsecase extends Usecase<User, SignupParams> {
  final AuthRepository authRepository;

  UserSignupUsecase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(SignupParams params) async {
    return await authRepository.signUpWithEmailPasword(params);
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;
  final bool agreeTerms;

  SignupParams({
    required this.name,
    required this.email,
    required this.password,
    required this.agreeTerms,
  });
}
