import 'package:flutter/material.dart';
import 'package:health_and_beyond/features/notification/presentation/widgets/app_bar.dart';
import 'package:health_and_beyond/features/notification/presentation/widgets/base.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationsAppBar(
        context: context,
        tabController: _tabController,
      ),
      body: NotificationBase(
        tabController: _tabController,
      ),
    );
  }
}
