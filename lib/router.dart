import 'package:bloc_counter/app_const.dart';
import 'package:bloc_counter/counter/counter_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.Home:
        return MaterialPageRoute(builder: (_) => CounterView());
      case RoutePath.Counter:
        return MaterialPageRoute(builder: (_) => CounterView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
