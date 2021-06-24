import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';
import 'package:health_and_beyond/core/resources/resources.dart';

class HomeNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onItemSelected;

  HomeNavigation({
    required this.currentIndex,
    required this.onItemSelected,
  });

  final List<IconData> _navigationIcons = <IconData>[
    Icons.dashboard,
    Icons.article_outlined,
    Icons.person,
  ];

  List<BottomNavigationBarItem> _navigationItems() {
    return List.generate(
      _navigationIcons.length,
      (index) => BottomNavigationBarItem(
        icon: Icon(_navigationIcons[index]),
        label: AppStrings.navigationTitles[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: AppDimensions.d8,
      unselectedItemColor: AppColors.inactiveColor,
      items: _navigationItems(),
      onTap: (index) => onItemSelected(index),
    );
  }
}
