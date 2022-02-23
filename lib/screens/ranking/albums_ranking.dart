import 'package:application_musicale/models/most_loved_album_response.dart';
import 'package:application_musicale/routes.dart';
import 'package:application_musicale/screens/item/ranking_list_item.dart';
import 'package:application_musicale/services/most_loved_service.dart';
import 'package:flutter/material.dart';

class AlbumsRanking extends StatefulWidget {
  const AlbumsRanking({Key? key}) : super(key: key);

  @override
  AlbumsRankingState createState() => AlbumsRankingState();
}

class AlbumsRankingState extends State<AlbumsRanking> {
  late Future<MostLovedAlbumResponse> futureMostLovedAlbum;

  @override
  void initState() {
    super.initState();
    futureMostLovedAlbum = MostLovedService().getMostLovedAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MostLovedAlbumResponse>(
        future: futureMostLovedAlbum,
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
                      return GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).pushNamed(
                            AppRoutes.routeAlbum,
                            arguments: snapshot.data!.loved![position].idAlbum,
                          );
                        },
                        child: RankingListItem(
                          rank: '${position + 1}',
                          picture:
                              snapshot.data!.loved![position].strAlbumThumb ??
                                  "",
                          title: snapshot.data!.loved![position].strAlbum ?? "",
                          subtitle:
                              snapshot.data!.loved![position].strArtist ?? "",
                        ),
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
