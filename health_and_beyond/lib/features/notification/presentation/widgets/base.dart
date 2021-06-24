// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/core/widgets/display_message.dart';
import 'package:health_and_beyond/features/core/widgets/progress.dart';
import 'package:health_and_beyond/features/notification/data/data_sources/notification_data_local_source.dart';
import 'package:health_and_beyond/features/notification/data/data_sources/notification_data_remote_source.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_object_model.dart';
import 'package:health_and_beyond/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_data.dart';
import 'package:health_and_beyond/features/notification/domain/usecases/notification_usecase.dart';
import 'package:health_and_beyond/features/notification/presentation/widgets/body.dart';
import 'package:provider/provider.dart';

class NotificationBase extends StatelessWidget {
  final TabController tabController;
  final GetNotificationData _getNotificationData = GetNotificationData(
    notificationRepository: NotificationRepositoryImpl(
      notificationDataRemoteSource: NotificationDataRemoteSourceImpl(),
      notificationDataLocalSource: NotificationDataLocalSourceImpl(),
    ),
  );

  NotificationBase({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthUser>(
      future: AppPreferences.getUser(),
      builder: (context, authUser) {
        if (authUser.data != null) {
          final AuthUser user = authUser.data!;

          return FutureProvider<AuthUser>(
            initialData: user,
            create: (context) => Future.value(user),
            child: FutureBuilder<Either<Failure, NotificationData>>(
              future: _getNotificationData.execute(
                notificationObject: NotificationObjectModel(
                  type: user.type,
                  uid: user.uid,
                  city: user.city,
                  state: user.state,
                ),
              ),
              builder: (context, data) {
                switch (data.connectionState) {
                  case ConnectionState.waiting:
                    return Progress();

                  case ConnectionState.done:
                    return _body(tabController, data.data!);

                  case ConnectionState.none:
                    return DisplayMessage(message: AppStrings.somethingWentWrong);

                  default:
                    return DisplayMessage(message: AppStrings.somethingWentWrong);
                }
              },
            ),
          );
        } else {
          return DisplayMessage(message: AppStrings.somethingWentWrong);
        }
      },
    );
  }
}

Widget _body(TabController tabController, Either<Failure, NotificationData> data) {
  Widget widget = Progress();
  data.fold(
    (left) {
      widget = DisplayMessage(message: left.message);
    },
    (right) {
      widget = NotificationBody(
        tabController: tabController,
        jsonData: jsonDecode(right.data),
      );
    },
  );
  return widget;
}
