import 'package:appli_musical/model/artist.dart';
import 'package:appli_musical/request/the_audio_db_api.dart';
import 'package:flutter/material.dart';

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  _TestApiScreenState createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<ArtistElement>?>(
          future: TheAudioDbApi().fetchArtistDatas("eminem"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Text(snapshot.data![0].strArtist);
            }
          },
        ),
      ),
    );
  }
}
