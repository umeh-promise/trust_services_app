import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUsecase extends Usecase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUserUsecase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
