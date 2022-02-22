import 'package:application_musicale/screens/screen/parole_screen.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

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
          ),
          onPressed: () => Navigator.of(context).pop(null),
          child: SvgPicture.asset(
            'asset/icones/Fleche_gauche.svg',
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Eminem',
          style: TextStyle(color: UIColors.white),
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
          children: const [TopSection(), BottomSection()],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('asset/image/Eminem-Revival.jpg')))),
        Positioned(
            top: 90,
            left: 15,
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('asset/image/Eminem-Revival.jpg'))))),
        const Positioned(
            left: 125,
            top: 90,
            child: Text(
              'Title album',
              style: TextStyle(
                  color: UIColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        const Positioned(
            left: 125,
            top: 120,
            child: Text(
              'numbers chanson',
              style: TextStyle(color: UIColors.silver),
            )),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

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
                      child: Row(
                        children: [
                          SvgPicture.asset('asset/icones/Etoile.svg'),
                          const Text(
                            '5.0',
                            style: TextStyle(color: UIColors.silver),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  '349 votes',
                  style: TextStyle(color: UIColors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: spacePadding,
          ),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
            style: TextStyle(color: UIColors.suvaGrey, fontSize: 15),
          ),
          SizedBox(
            height: spacePadding,
          ),
          TitleSection()
        ],
      ),
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
              'Titres',
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
        Column(
          children: favoriteTitle.map((title) {
            var index = favoriteTitle.indexOf(title) + 1;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: UIColors.white, onPrimary: UIColors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParoleScreen()));
              },
              child: Row(
                children: [
                  Text(
                    index.toString(),
                    style: const TextStyle(color: UIColors.black),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    title['title'],
                    style: const TextStyle(color: UIColors.black),
                  ),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
