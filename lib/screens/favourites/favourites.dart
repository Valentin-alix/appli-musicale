import 'package:application_musicale/data/database.dart';
import 'package:application_musicale/screens/item/albums_list_item.dart';
import 'package:application_musicale/screens/item/artists_list_item.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  FavouritesState createState() => FavouritesState();
}

class FavouritesState extends State<Favourites> {
  late Future<List> futureFavouritesArtists;
  late Future<List> futureFavouritesAlbums;

  @override
  initState() {
    super.initState();
    DatabaseManager().insertDataTest();
    futureFavouritesArtists = DatabaseManager().getFavouritesArtistsList();
    futureFavouritesAlbums = DatabaseManager().getFavouritesAlbumsList();
  }

  @override
  Widget build(BuildContext context) {
    const appBarTitle = 'Favoris';
    const appBarSubtitle = 'Mes artistes & albums';
    const bodyTitle1 = 'Artistes';
    const bodyTitle2 = 'Albums';

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
                    appBarTitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    appBarSubtitle,
                    style: TextStyle(
                      fontFamily: 'SFProText',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: UIColors.suvaGrey,
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
                FutureBuilder<List>(
                    future: futureFavouritesArtists,
                    builder: (context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data?.length,
                            itemBuilder: (BuildContext context, int position) {
                              return ArtistsListItem(
                                picture:
                                    snapshot.data![position].strArtistThumb,
                                title: snapshot.data![position].strArtist,
                                artistId: snapshot.data![position].artistId,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return const Text('Une erreur est survenue !');
                      } else {
                        return const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  UIColors.suvaGrey),
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                      }
                    }),
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
                FutureBuilder<List>(
                    future: futureFavouritesAlbums,
                    builder: (context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data?.length,
                            itemBuilder: (BuildContext context, int position) {
                              return AlbumsListItem(
                                picture: snapshot.data![position].strAlbumThumb,
                                title: snapshot.data![position].strAlbum,
                                subtitle: snapshot.data![position].strArtist,
                                albumId: snapshot.data![position].albumId,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return const Text('Une erreur est survenue !');
                      } else {
                        return const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  UIColors.suvaGrey),
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
