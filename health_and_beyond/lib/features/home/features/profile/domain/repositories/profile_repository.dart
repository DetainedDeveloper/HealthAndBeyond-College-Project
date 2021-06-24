// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_object.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> getUser({required ProfileObject profileObject});
}
