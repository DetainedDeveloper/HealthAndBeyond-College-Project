// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/home/features/profile/data/data_sources/profile_response_local_source.dart';
import 'package:health_and_beyond/features/home/features/profile/data/data_sources/profile_response_remote_source.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_object_model.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_response_model.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_object.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_response.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileResponseRemoteSource profileResponseRemoteSource;
  final ProfileResponseLocalSource profileResponseLocalSource;

  ProfileRepositoryImpl({
    required this.profileResponseRemoteSource,
    required this.profileResponseLocalSource,
  });

  @override
  Future<Either<Failure, ProfileResponse>> getUser({required ProfileObject profileObject}) async {
    if (await Network.connected) {
      try {
        final ProfileResponse profileResponse = await profileResponseRemoteSource.getProfileResponse(
          profileObjectModel: ProfileObjectModel.toProfileObjectModel(profileObject: profileObject),
        );
        await profileResponseLocalSource.setProfileResponse(
          profileResponseModel: ProfileResponseModel(data: profileResponse.data),
        );
        return Right(profileResponse);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.dataFailed));
      }
    } else {
      try {
        return Right(await profileResponseLocalSource.getProfileResponse());
      } on CacheException {
        return Left(NetworkFailure(message: AppStrings.dataFailed));
      }
    }
  }
}
