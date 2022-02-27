import 'package:application_musicale/models/album.dart';
import 'package:application_musicale/models/artist.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseManager {
  static const nameBox1 = "FavouritesArtistsBox";
  static const nameBox2 = "FavouritesAlbumsBox";
  List<Box> boxList = [];

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArtistAdapter());
    Hive.registerAdapter(AlbumAdapter());
    await _openBox();
  }

  // À supprimer
  Future<void> insertDataTest() async {
    final _favouritesArtistsBox = Hive.box(nameBox1);
    final _favouritesAlbumsBox = Hive.box(nameBox2);

    Artist artist1 = Artist('111279', "ABBA",
        "https://www.theaudiodb.com/images/media/artist/thumb/qyuqvy1375623610.jpg");
    await _favouritesArtistsBox.add(artist1);

    Artist artist2 = Artist('111258', "Metallica",
        "https://www.theaudiodb.com/images/media/artist/thumb/qyuqvy1375623610.jpg");
    await _favouritesArtistsBox.add(artist2);

    Album album1 = Album('2110231', "Lulu", "Metallica",
        "https://www.theaudiodb.com/images/media/album/thumb/lulu-4f872f3f80ff9.jpg");
    await _favouritesAlbumsBox.add(album1);
  }

  Future<List> getFavouritesArtistsList() async {
    final _favouritesArtistsBox = Hive.box(nameBox1);
    return _favouritesArtistsBox.values.toList();
  }

  Future<List> getFavouritesAlbumsList() async {
    final _favouritesAlbumsBox = Hive.box(nameBox2);
    return _favouritesAlbumsBox.values.toList();
  }

  Future<List<Box>> _openBox() async {
    Box _favouritesArtistsBox = await Hive.openBox(nameBox1);
    Box _favouritesAlbumsBox = await Hive.openBox(nameBox2);
    boxList.add(_favouritesArtistsBox);
    boxList.add(_favouritesAlbumsBox);
    return boxList;
  }
}
