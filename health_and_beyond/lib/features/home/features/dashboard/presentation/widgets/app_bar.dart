import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title, subtitle;

  DashboardAppBar({
    required this.context,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: AppColors.iconColor),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
        ),
        IconButton(
          onPressed: () {
            AppPreferences.logOut();
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          icon: Icon(Icons.logout, color: AppColors.iconColor),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, AppDimensions.d56);
}
