import 'package:flutter/material.dart';
import 'strings.dart';
import 'dimensions.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    appBarTheme: _AppBarTheme.appBarTheme,
    fontFamily: AppStrings.fontFamily,
    textTheme: _TextTheme.textTheme,
    primaryTextTheme: _TextTheme.textTheme,
    inputDecorationTheme: InputTheme.inputDecorationTheme,
    hintColor: AppColors.hintTextColor,
    buttonColor: AppColors.accentColor,
    iconTheme: _IconTheme.iconThemeData,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

class _TextTheme {
  static TextStyle _headline1 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _headline2 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _headline3 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _headline4 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _headline5 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _headline6 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _subtitle1 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _subtitle2 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _bodyText1 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _bodyText2 = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _button = TextStyle(
    color: AppColors.buttonTextColor,
  );
  static TextStyle _caption = TextStyle(
    color: AppColors.textColor,
  );
  static TextStyle _overline = TextStyle(
    color: AppColors.textColor,
  );

  static TextTheme textTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
    button: _button,
    caption: _caption,
    overline: _overline,
  );
}

class InputTheme {
  static OutlineInputBorder _inactiveOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.d4),
    borderSide: BorderSide(
      color: AppColors.inactiveColor,
      width: AppDimensions.d1,
    ),
  );

  static OutlineInputBorder _activeOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.d4),
    borderSide: BorderSide(
      color: AppColors.activeColor,
      width: AppDimensions.d2,
    ),
  );

  static TextStyle _hintStyle = TextStyle(
    fontSize: AppDimensions.d18,
    color: AppColors.hintTextColor,
  );

  static EdgeInsetsGeometry _contentPadding = EdgeInsets.symmetric(
    horizontal: AppDimensions.d16,
    vertical: AppDimensions.d4,
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: _inactiveOutlineInputBorder,
    focusedBorder: _activeOutlineInputBorder,
    hintStyle: _hintStyle,
    contentPadding: _contentPadding,
  );
}

class _AppBarTheme {
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  );
}

class _IconTheme {
  static IconThemeData iconThemeData = IconThemeData(
    color: AppColors.iconColor,
  );
}
