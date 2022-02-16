import 'package:application_musicale/model/albums_data.dart';
import 'package:application_musicale/model/artists_data.dart';
import 'package:application_musicale/search/albums_list_item.dart';
import 'package:application_musicale/search/artists_list_item.dart';
import 'package:application_musicale/util/app_icons.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    List<ArtistsData> artistsResults = _generateArtistsResults();
    List<AlbumsData> albumsResults = _generateAlbumsResults();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 110,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Rechercher',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Taper ici votre recherche',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_loupe,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: () {},
                        ),
                        isCollapsed: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_annuler,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: albumsResults.length,
                  itemBuilder: (BuildContext context, int position) {
                    return ArtistsListItem(artistsResults[position]);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Albums',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
