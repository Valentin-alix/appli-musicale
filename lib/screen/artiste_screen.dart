import 'package:application_musicale/model/artist_response.dart';
import 'package:application_musicale/request/the_audio_db_api.dart';
import 'package:application_musicale/screen/album_screen.dart';
import 'package:application_musicale/screen/parole_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArtisteScreen extends StatelessWidget {
  const ArtisteScreen({Key? key}) : super(key: key);
  final String artistName = 'khalid';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistElement>?>(
      future: TheAudioDbApi().fetchArtistDatas(artistName),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
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
                      minimumSize: (const Size(50, 50))),
                  onPressed: () => Navigator.of(context).pop(null),
                  child: SvgPicture.asset(
                    'asset/icones/Fleche_gauche.svg',
                    color: Colors.black,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.black,
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.black)),
                        minimumSize: (const Size(5, 5))),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'asset/icones/Like_on.svg',
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [TopSection(snapshot.data), BottomSection()],
                ),
              ));
        }
      },
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection(List<ArtistElement>? data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistElement>?>(
        future:
            TheAudioDbApi().fetchArtistDatas(const ArtisteScreen().artistName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return Stack(
              children: [
                Image.network(snapshot.data![0].strArtistFanart2),
                //Image.asset("asset/image/khalid_voiture.jpg"),
                Positioned(
                    child: Text(
                      snapshot.data![0].strArtist,
                      //snapshot.data![0].strArtist,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    top: 150,
                    left: 10),
                Positioned(
                    child: Text(
                      snapshot.data![0].strCountry,
                      //snapshot.data![0].strCountry,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    top: 200,
                    left: 10),
              ],
            );
          }
        });
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  final double spacePadding = 20;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistElement>?>(
        future:
            TheAudioDbApi().fetchArtistDatas(const ArtisteScreen().artistName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    snapshot.data![0].strBiographyEN,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: spacePadding),
                  AlbumSection(),
                  SizedBox(height: spacePadding),
                  TitleSection()
                ],
              ),
            );
          }
        });
  }
}

class AlbumSection extends StatelessWidget {
  final List albums = [
    {'title': 'After Hours', 'date': '2020'},
    {'title': 'Star boy', 'date': '2016'},
    {'title': 'Beauty behind the madness', 'date': '2015'}
  ];

  AlbumSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Album (number)",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: albums.map((album) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("asset/icones/Placeholder_album.svg"),
                        Text(album['title']),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlbumScreen()));
                            },
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                    Text(album['date']),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
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
          children: [
            Text(
              'Titres les plus appréciés',
              style: Theme.of(context).textTheme.subtitle1,
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
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ParoleScreen()));
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
