import 'dart:convert';

import 'package:appli_musical/model/artiste.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  getUserData() async {
    var response = await http.get(
        Uri.https('theaudiodb.com', 'api/v1/json/523532/search.php?s=khalid'));
    var jsonData = jsonDecode(response.body);
    List<Artiste> artistes = [];

    for (var data in jsonData) {
      Artiste artiste = Artiste(data['strArtist']);
      artistes.add(artiste);
    }

    print(artistes.length);
    return artistes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              getUserData();
            },
            icon: const Icon(Icons.http)),
      ),
    );
  }
}
