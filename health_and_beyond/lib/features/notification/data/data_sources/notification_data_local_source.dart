import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/features/notification/data/models/notification_data_model.dart';

abstract class NotificationDataLocalSource {
  Future<NotificationDataModel> getNotificationData();
  Future<void> setNotificationData({required NotificationDataModel notificationDataModel});
}

class NotificationDataLocalSourceImpl implements NotificationDataLocalSource {
  @override
  Future<NotificationDataModel> getNotificationData() async {
    final data = await AppPreferences.getDashboardData();
    return NotificationDataModel.fromData(data: data);
  }

  @override
  Future<void> setNotificationData({required NotificationDataModel notificationDataModel}) async {
    return AppPreferences.setDashboardData(notificationDataModel.data);
  }
}
