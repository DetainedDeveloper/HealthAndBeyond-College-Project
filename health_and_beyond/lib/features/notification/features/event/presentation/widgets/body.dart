import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/features/notification/features/event/domain/entities/single_event.dart';

class EventBody extends StatelessWidget {
  final SingleEvent event;

  EventBody({required this.event});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.name,
          style: TextStyle(fontSize: AppDimensions.d24),
        ),
        bottom: PreferredSize(
          preferredSize: Size(_size.width, AppDimensions.d32),
          child: Container(
            width: _size.width,
            margin: const EdgeInsets.only(left: AppDimensions.d72),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.organizer,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  event.drName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppDimensions.d16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Event Date : ' + event.date),
            Text('Event Time : ' + event.time),
            SizedBox(height: AppDimensions.d32),
            Text(event.description),
            SizedBox(height: AppDimensions.d32),
            Text('Address : ' + event.address),
            Text(event.pincode),
            Text(event.contact),
          ],
        ),
      ),
    );
  }
}
