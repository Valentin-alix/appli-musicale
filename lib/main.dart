import 'package:application_musicale/routes.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/screens/util/material_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/artist.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArtistAdapter());
  await Hive.openBox('FavouritesArtistsBox');
  await Hive.openBox('FavouritesAlbumsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Applicatiom mobile',
      theme: ThemeData(
        primarySwatch: UIMaterialColor.white,
        scaffoldBackgroundColor: UIColors.white,
      ),
      onGenerateRoute: AppRoutes.getRoutes,
    );
  }
}
