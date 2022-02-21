import 'package:application_musicale/screens/model/albums_data.dart';
import 'package:application_musicale/screens/ranking/albums_ranking_list_item.dart';
import 'package:flutter/material.dart';

class AlbumsRanking extends StatelessWidget {
  const AlbumsRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AlbumsData> results = _generateRandomResults();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (BuildContext context, int position) {
              return AlbumsRankingListItem(results[position]);
            },
          ),
        ),
      ],
    );
  }

  List<AlbumsData> _generateRandomResults() {
    return [
      AlbumsData(
        rank: 1,
        album: 'Willy And The Poor Boys',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      AlbumsData(
        rank: 2,
        album: 'Green River',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      AlbumsData(
        rank: 3,
        album: 'Bayou Country',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
    ];
  }
}
