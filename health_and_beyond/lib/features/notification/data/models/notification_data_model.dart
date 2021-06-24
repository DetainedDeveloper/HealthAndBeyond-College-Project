import 'package:health_and_beyond/features/notification/domain/entities/notification_data.dart';

class NotificationDataModel extends NotificationData {
  final String data;

  NotificationDataModel({required this.data}) : super(data: data);

  factory NotificationDataModel.fromData({required String data}) {
    return NotificationDataModel(data: data);
  }
}
