import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/repositories/auth_repository.dart';

class UserOnboardingUsecase extends Usecase<User, UserOnboardingParams> {
  final AuthRepository authRepository;

  UserOnboardingUsecase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserOnboardingParams params) async {
    return await authRepository.completeUserOnboarding(params);
  }
}

class UserOnboardingParams {
  final String role;
  final List<String> services;
  final String phone;
  final String dob;
  final String city;
  final String customService;
  final String address;
  final String state;
  final String shortBio;

  UserOnboardingParams({
    required this.role,
    required this.customService,
    required this.services,
    required this.state,
    required this.phone,
    required this.dob,
    required this.city,
    required this.address,
    required this.shortBio,
  });
}
