// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/profile_usecase.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_object.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_response.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/repositories/profile_repository.dart';

class GetProfileResponse implements ProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileResponse({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileResponse>> execute({required ProfileObject profileObject}) async {
    return await profileRepository.getUser(profileObject: profileObject);
  }
}
