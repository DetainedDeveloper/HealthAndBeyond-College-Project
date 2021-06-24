// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/exceptions.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/network/network.dart';
import 'package:health_and_beyond/core/resources/resources.dart';
import 'package:health_and_beyond/features/notification/data/data_sources/notification_data_local_source.dart';
import 'package:health_and_beyond/features/notification/data/data_sources/notification_data_remote_source.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_data_model.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_object_model.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_data.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_object.dart';
import 'package:health_and_beyond/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataRemoteSource notificationDataRemoteSource;
  final NotificationDataLocalSource notificationDataLocalSource;

  NotificationRepositoryImpl({
    required this.notificationDataRemoteSource,
    required this.notificationDataLocalSource,
  });

  @override
  Future<Either<Failure, NotificationData>> getNotificationData({required NotificationObject notificationObject}) async {
    if (await Network.connected) {
      try {
        final NotificationData notificationData = await notificationDataRemoteSource.getNotificationData(
          notificationObjectModel: NotificationObjectModel.toNotificationObjectModel(notificationObject: notificationObject),
        );
        await notificationDataLocalSource.setNotificationData(
          notificationDataModel: NotificationDataModel.fromData(data: notificationData.data),
        );
        return Right(notificationData);
      } on NetworkException {
        return Left(NetworkFailure(message: AppStrings.networkFailed));
      }
    } else {
      try {
        return Right(await notificationDataLocalSource.getNotificationData());
      } on CacheException {
        return Left(CacheFailure(message: AppStrings.dataFailed));
      }
    }
  }
}
