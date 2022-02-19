import 'package:application_musicale/item/albums_list_item.dart';
import 'package:application_musicale/item/artists_list_item.dart';
import 'package:application_musicale/model/albums_data.dart';
import 'package:application_musicale/model/artists_data.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ArtistsData> artistsResults = _generateArtistsResults();
    List<AlbumsData> albumsResults = _generateAlbumsResults();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Favoris',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Mes artistes & albums',
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8D8D8D),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Artistes',
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: albumsResults.length,
                  itemBuilder: (BuildContext context, int position) {
                    return ArtistsListItem(artistsResults[position]);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Albums',
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: albumsResults.length,
                  itemBuilder: (BuildContext context, int position) {
                    return AlbumsListItem(albumsResults[position]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ArtistsData> _generateArtistsResults() {
    return [
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      ArtistsData(
        artists: 'Creedence Clearwater Revival2',
        picture: '',
      ),
    ];
  }

  List<AlbumsData> _generateAlbumsResults() {
    return [
      AlbumsData(
        rank: 1,
        album: 'Willy And The Poor Boys',
        artists: 'Creedence Clearwater Revival',
        picture:
            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Creedence_Clearwater_Revival_1968.jpg',
      ),
      AlbumsData(
        rank: 1,
        album: 'Green River',
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      AlbumsData(
        rank: 1,
        album: 'Green River',
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      AlbumsData(
        rank: 1,
        album: 'Green River',
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
      AlbumsData(
        rank: 1,
        album: 'Green River',
        artists: 'Creedence Clearwater Revival',
        picture: '',
      ),
    ];
  }
}
