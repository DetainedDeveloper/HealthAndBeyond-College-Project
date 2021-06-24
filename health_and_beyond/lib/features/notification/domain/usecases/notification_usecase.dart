// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:health_and_beyond/core/errors/failure.dart';
import 'package:health_and_beyond/core/usecases/notification_usecase.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_data.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_object.dart';
import 'package:health_and_beyond/features/notification/domain/repositories/notification_repository.dart';

class GetNotificationData implements NotificationUseCase {
  final NotificationRepository notificationRepository;

  GetNotificationData({required this.notificationRepository});

  @override
  Future<Either<Failure, NotificationData>> execute({required NotificationObject notificationObject}) async {
    return await notificationRepository.getNotificationData(notificationObject: notificationObject);
  }
}
