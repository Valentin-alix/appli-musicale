import 'package:application_musicale/data/database.dart';
import 'package:application_musicale/routes.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/screens/util/material_colors.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  DatabaseManager().init();
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
