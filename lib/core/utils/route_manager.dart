import 'package:flutter/cupertino.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> push(Route route) async {
    navigatorKey.currentState?.push(route);
  }

  static Future<void> pushReplacement(Route route) async {
    navigatorKey.currentState?.pushReplacement(route);
  }

  static Future<void> pushAndRemoveUntil(Route route, bool replace) async {
    navigatorKey.currentState?.pushAndRemoveUntil(route, (route) => replace);
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }
}
