import 'package:application_musicale/data/database.dart';
import 'package:application_musicale/models/album_response.dart';
import 'package:application_musicale/models/artist_response.dart';
import 'package:application_musicale/models/track_response.dart';
import 'package:application_musicale/screens/album_screen.dart';
import 'package:application_musicale/screens/lyrics_screen.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/services/album_service.dart';
import 'package:application_musicale/services/artist_service.dart';
import 'package:application_musicale/services/track_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArtistScreen extends StatefulWidget {
  final String artistId;
  const ArtistScreen({Key? key, required this.artistId}) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  late Future<ArtistResponse> futureArtiste;

  @override
  void initState() {
    super.initState();
    futureArtiste = ArtistServices().fetchArtistById(widget.artistId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArtistResponse>(
        future: futureArtiste,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(UIColors.suvaGrey),
                ),
                height: 50.0,
                width: 50.0,
              ),
            );
          } else {
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: UIColors.transparent,
                  elevation: 0,
                  leading: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: UIColors.transparent,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                    child: SvgPicture.asset(
                      'asset/icones/Fleche_gauche.svg',
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: UIColors.transparent,
                      ),
                      onPressed: () async {
                        String artistId =
                            snapshot.data?.artist![0].idArtist ?? "";
                        String strArtist =
                            snapshot.data?.artist![0].strArtist ?? "";
                        String strArtistThumb =
                            snapshot.data?.artist![0].strArtistThumb ?? "";
                        bool isFavouriteArtist =
                            await DatabaseManager().isFavouriteArtist(artistId);
                        if (isFavouriteArtist == true) {
                          await DatabaseManager().deleteArtist(artistId);
                        }
                        if (isFavouriteArtist == false) {
                          await DatabaseManager().addArtist(
                            artistId,
                            strArtist,
                            strArtistThumb,
                          );
                        }
                      },
                      // TODO: Mettre à jour la couleur de l’icone
                      child: SvgPicture.asset(
                        'asset/icones/Like_off.svg',
                        colorBlendMode: BlendMode.modulate,
                        color: UIColors.white,
                        height: 35,
                      ),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      TopSection(
                        strArtistFanart2:
                            snapshot.data!.artist![0].strArtistFanart2 ?? "",
                        strArtist: snapshot.data!.artist![0].strArtist ?? "",
                        strCountry: snapshot.data!.artist![0].strCountry ?? "",
                      ),
                      BottomSection(
                        artistId: widget.artistId,
                        biographie:
                            snapshot.data!.artist![0].strBiographyEN ?? "",
                        strArtist: snapshot.data!.artist![0].strArtist ?? "",
                      )
                    ],
                  ),
                ));
          }
        });
  }
}

class TopSection extends StatelessWidget {
  final String strArtistFanart2;
  final String strArtist;
  final String strCountry;
  const TopSection(
      {Key? key,
      required this.strArtistFanart2,
      required this.strArtist,
      required this.strCountry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(strArtistFanart2),
        Positioned(
            child: Text(
              strArtist,
              style: const TextStyle(
                  color: UIColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            top: 150,
            left: 10),
        Positioned(
            child: Text(
              strCountry,
              style: const TextStyle(
                color: UIColors.silver,
                fontSize: 15,
              ),
            ),
            top: 200,
            left: 10),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  final String artistId;
  final String biographie;
  final String strArtist;
  const BottomSection(
      {Key? key,
      required this.artistId,
      required this.biographie,
      required this.strArtist})
      : super(key: key);
  final double spacePadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Text(
            biographie,
            maxLines: 4,
            style: const TextStyle(color: UIColors.suvaGrey, fontSize: 15),
          ),
          SizedBox(height: spacePadding),
          AlbumSection(
            artistId: artistId,
          ),
          SizedBox(height: spacePadding),
          TitleSection(
            nameArtist: strArtist,
          )
        ],
      ),
    );
  }
}

class AlbumSection extends StatefulWidget {
  final String artistId;
  const AlbumSection({Key? key, required this.artistId}) : super(key: key);

  @override
  State<AlbumSection> createState() => _AlbumSectionState();
}

class _AlbumSectionState extends State<AlbumSection> {
  late Future<AlbumResponse> futureAlbums;
  @override
  void initState() {
    super.initState();
    futureAlbums = AlbumServices().fetchAllAlbumByArtistID(widget.artistId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlbumResponse>(
        future: futureAlbums,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Albums (" + snapshot.data.album.length.toString() + ")",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: UIColors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        itemCount: snapshot.data.album.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              color: UIColors.whiteSmoke,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        (snapshot.data.album[index]
                                                    .strAlbumThumb !=
                                                null)
                                            ? Image.network(
                                                snapshot.data.album[index]
                                                    .strAlbumThumb,
                                                height: 50,
                                                width: 50,
                                              )
                                            : SvgPicture.asset(
                                                "asset/icones/Placeholder_album.svg"),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data.album[index].strAlbum,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text(snapshot.data.album[index]
                                                  .intYearReleased),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlbumScreen(
                                                            idAlbum: snapshot
                                                                .data
                                                                .album[index]
                                                                .idAlbum,
                                                          )));
                                        },
                                        icon: const Icon(
                                            Icons.arrow_forward_ios)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }
        });
  }
}

class TitleSection extends StatefulWidget {
  final String nameArtist;
  const TitleSection({Key? key, required this.nameArtist}) : super(key: key);

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  late Future<TrackResponse> futureTracks;

  @override
  void initState() {
    super.initState();
    futureTracks =
        TrackService().fetchMostLovedTrackByIdArtiste(widget.nameArtist);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Most popular titles',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
                  //height: 300,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.track?.length ?? 0,
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
