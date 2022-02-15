import 'package:application_musicale/ranking/albums_ranking.dart';
import 'package:application_musicale/ranking/titles_ranking.dart';
import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Classements',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.green,
            tabs: <Widget>[
              Tab(
                text: 'Titres',
              ),
              Tab(
                text: 'Albums',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            TitlesRanking(),
            AlbumsRanking(),
          ],
        ),
      ),
    );
  }
}
