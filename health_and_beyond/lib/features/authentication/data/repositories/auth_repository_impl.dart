// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/authentication/data/data_sources/auth_user_remote_source.dart';
import 'package:health_and_beyond/features/authentication/data/models/auth_object_model.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/entities.dart';
import 'package:health_and_beyond/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthUserRemoteSource authUserRemoteSource;

  AuthRepositoryImpl({required this.authUserRemoteSource});

  @override
  Future<Either<Failure, AuthUser>> getUser({required AuthObject authObject}) async {
    if(await Network.connected) {
      final AuthUser authUser = await authUserRemoteSource.getUser(authObjectModel: AuthObjectModel.toAuthObjectModel(authObject));

      // ignore: unnecessary_null_comparison
      if(authUser != null) {
        return Right(authUser);
      } else {
        return Left(LoginFailure(message: AppStrings.loginFailed));
      }
    } else {
      return Left(NetworkFailure(message: AppStrings.networkFailed));
    }
  }
}
