import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase extends Usecase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
