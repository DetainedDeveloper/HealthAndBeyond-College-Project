import 'package:flutter/material.dart';
import 'package:health_and_beyond/core/preferences/preferences.dart';
import 'package:health_and_beyond/core/resources/dimensions.dart';
import 'package:health_and_beyond/core/resources/resources.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () async {
        String _nexRoute = await AppPreferences.isLoggedIn ? AppRoutes.home : AppRoutes.login;
        Navigator.pushReplacementNamed(context, _nexRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/app_icon.png',
          width: AppDimensions.d256,
          height: AppDimensions.d256,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
