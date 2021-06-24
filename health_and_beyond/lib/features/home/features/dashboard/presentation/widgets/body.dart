import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/requests/request_constants.dart';
import 'stats_cards.dart';
import 'chart.dart';

class DashboardBody extends StatelessWidget {
  final jsonData;

  DashboardBody({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StatsCards(data: jsonData[RequestConstants.statsData]),
          Chart(data: jsonData[RequestConstants.cityData], type: RequestConstants.city),
          Chart(data: jsonData[RequestConstants.stateData], type: RequestConstants.state),
        ],
      ),
    );
  }
}
