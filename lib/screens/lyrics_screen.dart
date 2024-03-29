import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LyricsScreen extends StatelessWidget {
  final String title;
  const LyricsScreen({Key? key, required this.title}) : super(key: key);

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
            'Paroles',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopSection(
                title: title,
              ),
              Paroles()
            ],
          ),
        ));
  }
}

class TopSection extends StatelessWidget {
  final String title;
  const TopSection({Key? key, required this.title}) : super(key: key);

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
        Positioned(
            left: 140,
            top: 110,
            child: SizedBox(
              width: 200,
              child: Text(
                title,
                style: const TextStyle(
                    color: UIColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}

class Paroles extends StatelessWidget {
  const Paroles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: UIColors.suvaGrey),
      ),
    );
  }
}
