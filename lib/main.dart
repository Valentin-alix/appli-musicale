import 'package:application_musicale/screens/favourites/favourites.dart';
import 'package:application_musicale/screens/ranking/ranking.dart';
import 'package:application_musicale/screens/search/search.dart';
import 'package:application_musicale/screens/util/app_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applicatiom mobile',
      theme: ThemeData(
        primarySwatch: white,
        scaffoldBackgroundColor: white,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.accueil_classements,
              size: 18,
            ),
            label: 'Classements',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.accueil_recherche,
              size: 18,
            ),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppIcons.accueil_favoris,
              size: 18,
            ),
            label: 'Favoris',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00AC5A),
        unselectedItemColor: const Color(0xFFB9B9B9),
        onTap: _onItemTapped,
      ),
    );
  }
}
