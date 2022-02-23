import 'package:application_musicale/main.dart';
import 'package:application_musicale/screens/screen/album_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String routeHome = '/';
  static const String routeAlbum = '/album';

  const AppRoutes._();

  static Route<dynamic> getRoutes(RouteSettings settings) {
    WidgetBuilder builder;

    Uri route = Uri.parse(settings.name!);
    String routeName = settings.name!;
    dynamic arguments = settings.arguments;

    switch (routeName) {
      case routeHome:
        builder = (BuildContext context) => const Home();
        break;
      case routeAlbum:
        builder = (BuildContext context) => AlbumScreen(
              idAlbum: arguments,
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