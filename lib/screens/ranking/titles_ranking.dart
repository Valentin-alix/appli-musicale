import 'package:application_musicale/screens/item/ranking_list_item.dart';
import 'package:flutter/material.dart';

import '../model/titles_data.dart';

class TitlesRanking extends StatelessWidget {
  const TitlesRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TitlesData> results = _generateRandomResults();
    //Future<MostLovedAlbumResponse> mostLovedAlbums = MostLovedService().getMostLovedAlbums();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (BuildContext context, int position) {
              return RankingListItem(
                rank: results[position].rank.toString(),
                picture: results[position].picture,
                title: results[position].title,
                subtitle: results[position].artists,
              );
            },
          ),
        ),
      ],
    );
  }

  List<TitlesData> _generateRandomResults() {
    return [
      TitlesData(
        rank: 1,
        title: 'Fortunate Son',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      TitlesData(
        rank: 2,
        title: 'Have You Ever Seen The Rain',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      TitlesData(
        rank: 3,
        title: 'Bad Moon Rising',
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
    ];
  }
}
