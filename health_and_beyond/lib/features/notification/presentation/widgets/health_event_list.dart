import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/features/authentication/domain/entities/auth_user.dart';
import 'package:health_and_beyond/features/notification/domain/entities/single_health_event.dart';
import 'package:health_and_beyond/features/notification/features/event/presentation/screens/event.dart';
import 'package:provider/provider.dart';

class HealthEventList extends StatelessWidget {
  final List<dynamic> jsonData;

  HealthEventList({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    final AuthUser _user = Provider.of<AuthUser>(context);
    final Size _size = MediaQuery.of(context).size;
    final List<SingleHealthEvent> _eventList = _convertToEvents(jsonData).reversed.toList();

    return Container(
      width: _size.width,
      margin: const EdgeInsets.all(AppDimensions.d8),
      color: AppColors.primaryColor,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return Divider(color: AppColors.inactiveColor);
        },
        itemCount: _eventList.length,
        itemBuilder: (context, index) {
          final SingleHealthEvent singleHealthEvent = _eventList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.activeTabColor,
              child: Text(
                singleHealthEvent.id,
                style: TextStyle(
                  color: AppColors.activeColor,
                  fontSize: AppDimensions.d18,
                ),
              ),
            ),
            title: Text(
              singleHealthEvent.name,
              style: TextStyle(fontSize: AppDimensions.d18),
            ),
            subtitle: Text(
              singleHealthEvent.date,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(singleHealthEvent.time),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Event(
                  type: _user.type,
                  id: singleHealthEvent.id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<SingleHealthEvent> _convertToEvents(List<dynamic> jsonData) {
  return List.generate(
    jsonData.length,
    (index) => SingleHealthEvent.toSingleNotification(
      id: jsonData[index][RequestConstants.eventId],
      name: jsonData[index][RequestConstants.eventName],
      date: jsonData[index][RequestConstants.eventDate],
      time: jsonData[index][RequestConstants.eventTime],
    ),
  );
}
