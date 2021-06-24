import 'package:flutter/material.dart' show Widget, StatelessWidget, BuildContext, MaterialApp, runApp;
import 'core/resources/resources.dart' show AppStrings, AppTheme, AppRoutes;

void main() {
  runApp(HealthAndBeyond());
}

class HealthAndBeyond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.themeData,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
