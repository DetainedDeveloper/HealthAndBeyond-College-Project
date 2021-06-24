import 'package:health_and_beyond/core/requests/requests.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_data_model.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_object_model.dart';

abstract class NotificationDataRemoteSource {
  Future<NotificationDataModel> getNotificationData({required NotificationObjectModel notificationObjectModel});
}

class NotificationDataRemoteSourceImpl implements NotificationDataRemoteSource {
  @override
  Future<NotificationDataModel> getNotificationData({required NotificationObjectModel notificationObjectModel}) async {
    final data = await AppRequests.getNotificationJSONData(notificationObjectModel: notificationObjectModel);
    return NotificationDataModel(data: data);
  }
}
