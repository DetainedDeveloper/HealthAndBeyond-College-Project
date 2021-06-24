import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/notification/domain/entities/notification_object.dart';

class NotificationObjectModel extends NotificationObject {
  final String type, uid, city, state;

  NotificationObjectModel({
    required this.type,
    required this.uid,
    required this.city,
    required this.state,
  }) : super(
          type: type,
          uid: uid,
          city: city,
          state: state,
        );

  factory NotificationObjectModel.toNotificationObjectModel({required NotificationObject notificationObject}) {
    return NotificationObjectModel(
      type: notificationObject.type,
      uid: notificationObject.uid,
      city: notificationObject.city,
      state: notificationObject.state,
    );
  }

  static Map<String, String> toMap(NotificationObjectModel notificationObjectModel) {
    return {
      RequestConstants.type: notificationObjectModel.type,
      RequestConstants.uid: notificationObjectModel.uid,
      RequestConstants.city: notificationObjectModel.city,
      RequestConstants.state: notificationObjectModel.state,
    };
  }
}
