import 'package:flutter/material.dart';
import 'dimensions.dart';
import 'colors.dart';
import 'theme.dart';

class AppStyles {
  static TextStyle textStyle = TextStyle(
    fontSize: AppDimensions.d18,
    color: AppColors.textColor,
  );

  static TextStyle snackBarTitleTextStyle = TextStyle(
    fontSize: AppDimensions.d16,
    color: AppColors.snackBarTextColor,
  );

  static InputDecoration inputDecoration = InputDecoration(
    border: InputTheme.inputDecorationTheme.border,
    focusedBorder: InputTheme.inputDecorationTheme.focusedBorder,
    hintStyle: InputTheme.inputDecorationTheme.hintStyle,
    contentPadding: InputTheme.inputDecorationTheme.contentPadding,
  );
}
