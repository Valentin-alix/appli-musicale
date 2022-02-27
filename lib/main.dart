import 'package:application_musicale/routes.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/screens/util/material_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/album.dart';
import 'models/artist.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArtistAdapter());
  Hive.registerAdapter(AlbumAdapter());
  await _openBox();
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

List<Box> boxList = [];
Future<List<Box>> _openBox() async {
  var favouritesArtistsBox = await Hive.openBox("FavouritesArtistsBox");
  var favouritesAlbumsBox = await Hive.openBox("FavouritesAlbumsBox");
  boxList.add(favouritesArtistsBox);
  boxList.add(favouritesAlbumsBox);
  return boxList;
}
