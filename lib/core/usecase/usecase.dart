import 'package:fpdart/fpdart.dart';
import 'package:trust_services_app/core/errors/failure.dart';

abstract class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
