import 'package:application_musicale/models/album.dart';
import 'package:application_musicale/models/artist.dart';
import 'package:application_musicale/screens/item/albums_list_item.dart';
import 'package:application_musicale/screens/item/artists_list_item.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

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
    insertData();
    futureFavouritesArtists = getFavouritesArtistsList();
    futureFavouritesAlbums = getFavouritesAlbumsList();
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

  Future<void> insertData() async {
    final favouritesArtistsBox = Hive.box('FavouritesArtistsBox');
    final favouritesAlbumsBox = Hive.box('FavouritesAlbumsBox');

    Artist artist1 = Artist('111279', "ABBA",
        "https://www.theaudiodb.com/images/media/artist/thumb/qyuqvy1375623610.jpg");
    await favouritesArtistsBox.add(artist1);

    Artist artist2 = Artist('111258', "Metallica",
        "https://www.theaudiodb.com/images/media/artist/thumb/qyuqvy1375623610.jpg");
    await favouritesArtistsBox.add(artist2);

    Album album1 = Album('2110231', "Lulu", "Metallica",
        "https://www.theaudiodb.com/images/media/album/thumb/lulu-4f872f3f80ff9.jpg");
    await favouritesAlbumsBox.add(album1);
  }

  Future<List> getFavouritesArtistsList() async {
    final favouritesBox = Hive.box('FavouritesArtistsBox');
    return favouritesBox.values.toList();
  }

  Future<List> getFavouritesAlbumsList() async {
    final favouritesAlbumsBox = Hive.box('FavouritesAlbumsBox');
    return favouritesAlbumsBox.values.toList();
  }
}
