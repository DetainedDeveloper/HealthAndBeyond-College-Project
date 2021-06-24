import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/resources/styles.dart';

class SnackBarMessage {
  static void displayMessage({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppStyles.snackBarTitleTextStyle,
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
