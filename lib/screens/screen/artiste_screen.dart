import 'package:application_musicale/models/album_response.dart';
import 'package:application_musicale/screens/screen/parole_screen.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/services/artist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/artist_response.dart';
import '../../services/album_service.dart';
import 'album_screen.dart';

class ArtisteScreen extends StatefulWidget {
  final String artistId;
  const ArtisteScreen({Key? key, required this.artistId}) : super(key: key);

  @override
  State<ArtisteScreen> createState() => _ArtisteScreenState();
}

class _ArtisteScreenState extends State<ArtisteScreen> {
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
            return const CircularProgressIndicator();
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
                        snapshot: snapshot,
                      ),
                      BottomSection(
                        snapshot: snapshot,
                        artistId: widget.artistId,
                      )
                    ],
                  ),
                ));
          }
        });
  }
}

class TopSection extends StatefulWidget {
  final AsyncSnapshot<ArtistResponse> snapshot;
  const TopSection({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(widget.snapshot.data!.artist![0].strArtistFanart2),
        Positioned(
            child: Text(
              widget.snapshot.data!.artist![0].strArtist,
              style: const TextStyle(
                  color: UIColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            top: 150,
            left: 10),
        Positioned(
            child: Text(
              widget.snapshot.data!.artist![0].strCountry,
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

class BottomSection extends StatefulWidget {
  final AsyncSnapshot<ArtistResponse> snapshot;
  final String artistId;
  const BottomSection(
      {Key? key, required this.snapshot, required this.artistId})
      : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  final double spacePadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Text(
            widget.snapshot.data!.artist![0].strBiographyEN,
            maxLines: 4,
            style: const TextStyle(color: UIColors.suvaGrey, fontSize: 15),
          ),
          SizedBox(height: spacePadding),
          AlbumSection(
            artistId: widget.artistId,
          ),
          SizedBox(height: spacePadding),
          TitleSection()
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

  final List albums = [
    {
      'title': 'After Hours',
      'date': '2020',
      'urlImage':
          "https://www.theaudiodb.com/images/media/album/3dthumb/70xhx11605597679.png"
    },
    {'title': 'Star boy', 'date': '2016', 'urlImage': ''},
    {'title': 'Beauty behind the madness', 'date': '2015', 'urlImage': ''},
    {'title': 'Star boy', 'date': '2016', 'urlImage': ''},
    {'title': 'Star boy', 'date': '2016', 'urlImage': ''},
    {'title': 'Star boy', 'date': '2016', 'urlImage': ''}
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlbumResponse>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            //print(snapshot.data?.album?.length);
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Albums (" + albums.length.toString() + ")",
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
                        itemCount: albums.length,
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
                                        (albums[index]['urlImage'] != '')
                                            ? Image.network(
                                                albums[index]['urlImage'],
                                                height: 50,
                                                width: 50,
                                              )
                                            : SvgPicture.asset(
                                                "asset/icones/Placeholder_album.svg"),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              albums[index]['title'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(albums[index]['date']),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const AlbumScreen(
                                                            idAlbum: "2110232",
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

class TitleSection extends StatelessWidget {
  final List favoriteTitle = [
    {'title': 'Walk on Water feat Beyoncé'},
    {'title': 'Believe'},
    {'title': 'Chlorasceptic feat Phresher'},
    {'title': 'Untouchable'},
    {'title': 'River feat Ed Sheeran'},
    {'title': 'Remind me (Intro)'},
    {'title': 'Remind me'},
  ];

  TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Titres les plus appréciés',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: favoriteTitle.map((title) {
            int index = favoriteTitle.indexOf(title) + 1;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, onPrimary: Colors.black),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ParoleScreen(
                          title: title['title'],
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      index.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Container(
                      width: 20,
                    ),
                    Text(
                      title['title'],
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
