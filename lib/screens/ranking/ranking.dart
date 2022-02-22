import 'package:application_musicale/screens/ranking/albums_ranking.dart';
import 'package:application_musicale/screens/ranking/titles_ranking.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appBarTitle = 'Classements';
    List tabBarItems = [
      {
        'widget': const TitlesRanking(),
        'label': 'Titres',
      },
      {
        'widget': const AlbumsRanking(),
        'label': 'Albums',
      },
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            appBarTitle,
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          bottom: TabBar(
            indicatorColor: UIColors.pigmentGreen,
            labelColor: UIColors.black,
            unselectedLabelColor: UIColors.suvaGrey,
            labelStyle: const TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            tabs: <Widget>[
              for (var item in tabBarItems)
                Tab(
                  text: item['label'],
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (var item in tabBarItems) item['widget'],
          ],
        ),
      ),
    );
  }
}
