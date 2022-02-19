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
              fontFamily: 'SFProDisplay',
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFF00AC5A),
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xFF8D8D8D),
            labelStyle: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
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
