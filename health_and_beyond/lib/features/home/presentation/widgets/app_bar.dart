import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title, subtitle;

  HomeAppBar({
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
        PopupMenuButton<String>(
          onSelected: (choice) {
            AppPreferences.logOut();
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          itemBuilder: (context) {
            return List.generate(
              1,
              (index) => PopupMenuItem(
                value: AppStrings.logOut,
                child: Text(AppStrings.logOut),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, AppDimensions.d56);
}
