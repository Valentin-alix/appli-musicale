import 'package:application_musicale/screens/main3.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String routeHome = '/';
  static const String routeScreen2 = '/p2';

  const AppRoutes._();

  static Route<dynamic> getRoutes(RouteSettings settings) {
    WidgetBuilder builder;

    Uri route = Uri.parse(settings.name!);
    String routeName = settings.name!;
    dynamic arguments = settings.arguments;

    switch (routeName) {
      case routeHome:
        builder = (BuildContext context) => const Screen1();
        break;
      case routeScreen2:
        builder = (BuildContext context) => Screen2(
              arg: arguments,
            );
        break;
      default:
        throw Exception('');
    }

    return MaterialPageRoute<dynamic>(
      builder: builder,
      settings: settings,
    );
  }
}
