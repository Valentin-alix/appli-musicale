import 'package:application_musicale/screens/screen/album_screen.dart';
import 'package:application_musicale/screens/screen/parole_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArtisteScreen extends StatelessWidget {
  const ArtisteScreen({Key? key}) : super(key: key);
  final String artistName = 'khalid';
  @override
  Widget build(BuildContext context) {
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
                  primary: Colors.transparent,
                  minimumSize: (const Size(50, 50))),
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
            children: [TopSection(), BottomSection()],
          ),
        ));
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("asset/image/khalid_voiture.jpg"),
        //Image.asset("asset/image/khalid_voiture.jpg"),
        const Positioned(
            child: Text(
              "khalid",
              //snapshot.data![0].strArtist,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            top: 150,
            left: 10),
        const Positioned(
            child: Text(
              "country",
              //snapshot.data![0].strCountry,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
            top: 200,
            left: 10),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  final double spacePadding = 20;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: spacePadding),
          AlbumSection(),
          SizedBox(height: spacePadding),
          TitleSection()
        ],
      ),
    );
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
          children: const [
            Text(
              "Album (number)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                color: const Color(0xFFDCD8D7),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              "asset/icones/Placeholder_album.svg"),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                album['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(album['date']),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AlbumScreen()));
                          },
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParoleScreen()));
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
