import 'package:application_musicale/models/most_loved_track_response.dart';
import 'package:application_musicale/screens/item/ranking_list_item.dart';
import 'package:application_musicale/services/most_loved_service.dart';
import 'package:flutter/material.dart';

class TitlesRanking extends StatefulWidget {
  const TitlesRanking({Key? key}) : super(key: key);

  @override
  TitlesRankingState createState() => TitlesRankingState();
}

class TitlesRankingState extends State<TitlesRanking> {
  //MostLovedService().getMostLovedAlbums();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int position) {
              return RankingListItem(
                rank: "",
                picture: "",
                title: "",
                subtitle: "",
              );
            },
          ),
        ),
      ],
    );
  }
}
