import 'package:application_musicale/models/album_response.dart';
import 'package:application_musicale/models/track_response.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/services/album_service.dart';
import 'package:application_musicale/services/track_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'lyrics_screen.dart';

class AlbumScreen extends StatefulWidget {
  final String idAlbum;

  const AlbumScreen({Key? key, required this.idAlbum}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late Future<TrackResponse> futureTracks;
  late Future<AlbumResponse> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumServices().fetchAlbumById(widget.idAlbum);
    futureTracks = TrackService().fetchTrackByIdAlbum(widget.idAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlbumResponse>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                  ),
                  onPressed: () => Navigator.of(context).pop(null),
                  child: SvgPicture.asset(
                    'asset/icones/Fleche_gauche.svg',
                  ),
                ),
                centerTitle: true,
                title: Text(
                  snapshot.data?.album![0].strArtist ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'asset/icones/Like_off.svg',
                      height: 35,
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TopSection(
                      idAlbum: widget.idAlbum.toString(),
                      snapshot: snapshot,
                    ),
                    BottomSection(
                      idAlbum: widget.idAlbum,
                      snapshot: snapshot,
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}

class TopSection extends StatelessWidget {
  final AsyncSnapshot<AlbumResponse> snapshot;
  final String idAlbum;
  const TopSection({Key? key, required this.idAlbum, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: const ColorFilter.mode(
                        Colors.black45, BlendMode.darken),
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        snapshot.data?.album![0].strAlbumThumb ?? "")))),
        Positioned(
            top: 90,
            left: 15,
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            snapshot.data?.album![0].strAlbumThumb ?? ""))))),
        Positioned(
            left: 125,
            top: 90,
            child: Text(
              snapshot.data?.album![0].strAlbum ?? "",
              style: const TextStyle(
                  color: UIColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  final String idAlbum;
  final AsyncSnapshot<AlbumResponse> snapshot;
  const BottomSection({Key? key, required this.snapshot, required this.idAlbum})
      : super(key: key);

  final double spacePadding = 15;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            height: spacePadding,
          ),
          Container(
            color: UIColors.whiteSmoke,
            height: 35,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                  child: Container(
                    height: 20,
                    color: UIColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: (snapshot.data?.album![0].intScoreVotes) == null
                          ? const Text("No score votes")
                          : Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: (double.parse(
                                          snapshot.data?.album![0].intScore ??
                                              "0") /
                                      2),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber),
                                  onRatingUpdate: (rating) {},
                                ),
                                Text(
                                  (double.parse(snapshot
                                                  .data?.album![0].intScore ??
                                              "0") /
                                          2)
                                      .toString(),
                                  style:
                                      const TextStyle(color: UIColors.silver),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Text(
                  snapshot.data?.album![0].intScoreVotes ?? "",
                  style: const TextStyle(color: UIColors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: spacePadding,
          ),
          Text(
            snapshot.data?.album![0].strDescriptionEN ?? "",
            maxLines: 4,
            style: const TextStyle(color: UIColors.suvaGrey, fontSize: 15),
          ),
          SizedBox(
            height: spacePadding,
          ),
          TitleSection(
            idAlbum: idAlbum,
          )
        ],
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  final String idAlbum;
  const TitleSection({Key? key, required this.idAlbum}) : super(key: key);

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  late Future<TrackResponse> futureTracks;

  @override
  void initState() {
    super.initState();
    futureTracks = TrackService().fetchTrackByIdAlbum(widget.idAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Titles',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: UIColors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<TrackResponse>(
            future: futureTracks,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return SizedBox(
                  height: 250,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.track?.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: UIColors.white,
                                onPrimary: UIColors.black),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsScreen(
                                            title: snapshot.data?.track![index]
                                                    .strTrack ??
                                                "",
                                          )));
                            },
                            child: Row(
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(color: UIColors.black),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  snapshot.data?.track![index].strTrack ?? "",
                                  style: const TextStyle(color: UIColors.black),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                );
              }
            })
      ],
    );
  }
}
