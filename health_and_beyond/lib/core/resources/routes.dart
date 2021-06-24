import 'package:flutter/widgets.dart' show WidgetBuilder;
import 'package:health_and_beyond/features/authentication/presentation/screens/login.dart';
import 'package:health_and_beyond/features/home/presentation/screens/home.dart';
import 'package:health_and_beyond/features/notification/presentation/screens/notifications.dart';
import 'package:health_and_beyond/features/splash/presentation/screens/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String notifications = '/notifications';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (_) => Splash(),
    login: (_) => Login(),
    home: (_) => Home(),
    notifications: (_) => Notifications(),
  };
}
