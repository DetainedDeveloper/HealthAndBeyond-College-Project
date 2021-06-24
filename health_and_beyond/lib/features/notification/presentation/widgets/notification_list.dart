import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/features/notification/domain/entities/single_notification.dart';

class NotificationList extends StatelessWidget {
  final List<dynamic> jsonData;

  NotificationList({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final List<SingleNotification> _notificationList = _convertToNotifications(jsonData).reversed.toList();

    return Container(
      width: _size.width,
      margin: const EdgeInsets.all(AppDimensions.d8),
      color: AppColors.primaryColor,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return Divider(color: AppColors.inactiveColor);
        },
        itemCount: _notificationList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.activeTabColor,
              child: Text(
                _notificationList[index].id,
                style: TextStyle(
                  color: AppColors.activeColor,
                  fontSize: AppDimensions.d18,
                ),
              ),
            ),
            title: Text(
              _notificationList[index].description,
              style: TextStyle(fontSize: AppDimensions.d18),
            ),
            subtitle: Text(
              _notificationList[index].date,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(_notificationList[index].time),
          );
        },
      ),
    );
  }
}

List<SingleNotification> _convertToNotifications(List<dynamic> jsonData) {
  return List.generate(
    jsonData.length,
    (index) => SingleNotification.toSingleNotification(
      id: jsonData[index][RequestConstants.notificationId],
      description: jsonData[index][RequestConstants.notificationDescription],
      date: jsonData[index][RequestConstants.notificationDate],
      time: jsonData[index][RequestConstants.notificationTime],
    ),
  );
}
