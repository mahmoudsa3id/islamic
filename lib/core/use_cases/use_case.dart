import 'package:dartz/dartz.dart';
import 'package:islamic/core/errors/failure.dart';

abstract class UseCase<T, param> {
  Future<Either<Failure, T>> call([param param]);
}

class NoParams {}
