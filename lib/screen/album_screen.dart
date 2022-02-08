import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Eminem'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: Column(
        children: const [TopSection(), BottomSection()],
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
            left: 120,
            top: 90,
            child: Text(
              'Title album',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        const Positioned(
            left: 120,
            top: 120,
            child: Text(
              'numbers chanson',
              style: TextStyle(color: Colors.white),
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: spacePadding,
          ),
          Container(
            color: Colors.grey,
            child: Row(
              children: [
                const Icon(Icons.star),
                const Text('5'),
                Container(
                  width: 30,
                ),
                const Text('349 votes'),
              ],
            ),
          ),
          SizedBox(
            height: spacePadding,
          ),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
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
          children: [
            Text(
              'Titres',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: favoriteTitle.map((title) {
            var index = favoriteTitle.indexOf(title) + 1;
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
