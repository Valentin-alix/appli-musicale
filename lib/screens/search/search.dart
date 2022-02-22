import 'package:application_musicale/screens/item/albums_list_item.dart';
import 'package:application_musicale/screens/item/artists_list_item.dart';
import 'package:application_musicale/screens/model/albums_data.dart';
import 'package:application_musicale/screens/model/artists_data.dart';
import 'package:application_musicale/screens/util/app_icons.dart';
import 'package:application_musicale/screens/util/colors.dart';
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
    const appBarTitle = 'Rechercher';
    const appBarPlaceholder = 'Taper ici votre recherche';
    const bodyTitle1 = 'Artistes';
    const bodyTitle2 = 'Albums';

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
                    appBarTitle,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: UIColors.suvaGrey,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: appBarPlaceholder,
                        hintStyle: const TextStyle(
                          fontFamily: 'SFProText',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_loupe,
                            color: UIColors.silver,
                            size: 13,
                          ),
                          onPressed: () {},
                        ),
                        isCollapsed: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_annuler,
                            color: UIColors.silver,
                            size: 16,
                          ),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: UIColors.whisper,
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
                  bodyTitle1,
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
                  bodyTitle2,
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
