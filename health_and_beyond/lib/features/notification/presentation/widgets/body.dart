import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/features/notification/presentation/widgets/health_event_list.dart';
import 'package:health_and_beyond/features/notification/presentation/widgets/notification_list.dart';

class NotificationBody extends StatelessWidget {
  final TabController tabController;
  final jsonData;

  NotificationBody({
    required this.tabController,
    required this.jsonData,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        NotificationList(jsonData: jsonData[RequestConstants.notificationData]),
        HealthEventList(jsonData: jsonData[RequestConstants.healthEventData])
      ],
    );
  }
}
