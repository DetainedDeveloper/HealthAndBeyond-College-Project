import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/colors.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator(color: AppColors.activeColor)),
    );
  }
}
