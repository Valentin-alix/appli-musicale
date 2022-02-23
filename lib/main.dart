import 'package:application_musicale/routes.dart';
import 'package:application_musicale/screens/favourites/favourites.dart';
import 'package:application_musicale/screens/ranking/ranking.dart';
import 'package:application_musicale/screens/search/search.dart';
import 'package:application_musicale/screens/util/app_icons.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/screens/util/material_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applicatiom mobile',
      theme: ThemeData(
        primarySwatch: UIMaterialColor.white,
        scaffoldBackgroundColor: UIColors.white,
      ),
      onGenerateRoute: AppRoutes.getRoutes,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List bottomNavigationBarItems = [
    {
      'icon': AppIcons.accueil_classements,
      'label': 'Classements',
    },
    {
      'icon': AppIcons.accueil_recherche,
      'label': 'Recherche',
    },
    {
      'icon': AppIcons.accueil_favoris,
      'label': 'Favoris',
    },
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Ranking(),
    Search(),
    Favourites(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (var item in bottomNavigationBarItems)
            BottomNavigationBarItem(
              icon: Icon(
                item['icon'],
                size: 18,
              ),
              label: item['label'],
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: UIColors.pigmentGreen,
        unselectedItemColor: UIColors.silver,
        onTap: _onItemTapped,
      ),
    );
  }
}
