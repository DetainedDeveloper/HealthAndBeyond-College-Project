// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_object.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> getUser({required AuthObject authObject});
}
