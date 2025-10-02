import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase extends Usecase<void, ForgotPasswordParams> {
  final AuthRepository authRepository;

  ForgotPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(ForgotPasswordParams params) async {
    return await authRepository.forgotPassword(params);
  }
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({required this.email});
}
