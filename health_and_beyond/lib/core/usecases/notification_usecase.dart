// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_data.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_object.dart';

abstract class NotificationUseCase {
  Future<Either<Failure, NotificationData>> execute({required NotificationObject notificationObject});
}
