// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/progress.dart';
import 'package:health_and_beyond/features/home/features/profile/data/data_sources/profile_response_local_source.dart';
import 'package:health_and_beyond/features/home/features/profile/data/data_sources/profile_response_remote_source.dart';
import 'package:health_and_beyond/features/home/features/profile/data/models/profile_object_model.dart';
import 'package:health_and_beyond/features/home/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/entities/profile_response.dart';
import 'package:health_and_beyond/features/home/features/profile/domain/usecases/profile_usecase.dart';
import 'package:health_and_beyond/features/home/features/profile/presentation/widgets/body.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final GetProfileResponse _getProfileResponse = GetProfileResponse(
    profileRepository: ProfileRepositoryImpl(
      profileResponseRemoteSource: ProfileResponseRemoteSourceImpl(),
      profileResponseLocalSource: ProfileResponseLocalSourceImpl(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final AuthUser _user = Provider.of<AuthUser>(context);
    return FutureBuilder<Either<Failure, ProfileResponse>>(
      future: _getProfileResponse.execute(
        profileObject: ProfileObjectModel(
          uid: _user.uid,
          type: _user.type,
        ),
      ),
      builder: (context, data) {
        switch (data.connectionState) {
          case ConnectionState.waiting:
            return Progress();

          case ConnectionState.done:
            return _body(_user.uid, _user.type, data.data!);

          case ConnectionState.none:
            return DisplayMessage(message: AppStrings.somethingWentWrong);

          default:
            return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _body(String uid, String type, Either<Failure, ProfileResponse> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      widget = ProfileBody(uid: uid, type: type, data: right.data);
    },
  );
  return widget;
}
