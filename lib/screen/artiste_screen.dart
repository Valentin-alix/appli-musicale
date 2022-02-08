import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArtisteScreen extends StatelessWidget {
  const ArtisteScreen({Key? key}) : super(key: key);

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
            onPressed: () {},
            child: SvgPicture.asset(
              'asset/icones/Fleche_gauche.svg',
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  shape:
                      const CircleBorder(side: BorderSide(color: Colors.white)),
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
            children: const [TopSection(), BottomSection()],
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
        const Positioned(
            child: Text(
              "Nom Artiste",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            top: 180,
            left: 10),
        const Positioned(
            child: Text(
              "Lieu",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
            top: 220,
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
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
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
                            onPressed: () {},
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
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    index.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(title['title'])
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
