import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/strings.dart';
import 'package:health_and_beyond/core/resources/styles.dart';

class NotificationsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final BuildContext context;

  NotificationsAppBar({
    required this.context,
    required this.tabController,
  });

  List<Tab> _tabs() {
    return List.generate(
      AppStrings.notificationTabs.length,
      (index) => Tab(
        text: AppStrings.notificationTabs[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Notifications'),
      bottom: TabBar(
        controller: tabController,
        tabs: _tabs(),
        labelColor: AppColors.activeColor,
        labelStyle: AppStyles.textStyle.copyWith(
          fontSize: AppDimensions.d16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.inactiveColor,
        unselectedLabelStyle: AppStyles.textStyle.copyWith(
          fontSize: AppDimensions.d16,
        ),
        indicator: BoxDecoration(
          color: AppColors.activeTabColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, AppDimensions.d112);
}
