// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/auth_usecase.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_object.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/authentication/domain/repositories/auth_repository.dart';

class GetAuthUser implements AuthUseCase {
  final AuthRepository authRepository;

  GetAuthUser({required this.authRepository});

  @override
  Future<Either<Failure, AuthUser>> execute({required AuthObject authObject}) async {
    return await authRepository.getUser(authObject: authObject);
  }
}
