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
  late Future<MostLovedTrackResponse> futureMostLovedTrack;

  @override
  void initState() {
    super.initState();
    futureMostLovedTrack = MostLovedService().getMostLovedTracks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MostLovedTrackResponse>(
        future: futureMostLovedTrack,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.loved!.length,
                    itemBuilder: (BuildContext context, int position) {
                      return RankingListItem(
                        rank: '${position + 1}',
                        picture:
                            snapshot.data!.loved![position].strTrackThumb ?? "",
                        title: snapshot.data!.loved![position].strTrack ?? "",
                        subtitle:
                            snapshot.data!.loved![position].strArtist ?? "",
                      );
                    },
                  ),
                ),
              ],
            );
          }
        });
  }
}
