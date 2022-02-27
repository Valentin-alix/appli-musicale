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

  Future<void> addArtist(
      String artistId, String strArtist, String strArtistThumb) async {
    final _favouritesArtistsBox = Hive.box(nameBox1);

    Artist artist = Artist(artistId, strArtist, strArtistThumb);
    await _favouritesArtistsBox.put(artistId, artist);
  }

  Future<void> addAlbum(String albumId, String strAlbum, String strArtist,
      String strAlbumThumb) async {
    final _favouritesAlbumsBox = Hive.box(nameBox2);

    Album album = Album(albumId, strAlbum, strArtist, strAlbumThumb);
    await _favouritesAlbumsBox.put(albumId, album);
  }

  Future<void> deleteArtist(String artistId) async {
    final _favouritesArtistsBox = Hive.box(nameBox1);

    await _favouritesArtistsBox.delete(artistId);
  }

  Future<void> deleteAlbum(String albumId) async {
    final _favouritesAlbumsBox = Hive.box(nameBox2);

    await _favouritesAlbumsBox.delete(albumId);
  }

  Future<List> getFavouritesArtistsList() async {
    final _favouritesArtistsBox = Hive.box(nameBox1);
    return _favouritesArtistsBox.values.toList();
  }

  Future<List> getFavouritesAlbumsList() async {
    final _favouritesAlbumsBox = Hive.box(nameBox2);
    return _favouritesAlbumsBox.values.toList();
  }

  Future<bool> isFavouriteArtist(String artistId) async {
    final _favouritesArtistsBox = Hive.box(nameBox1);
    return _favouritesArtistsBox.containsKey(artistId);
  }

  Future<bool> isFavouriteAlbum(String albumId) async {
    final _favouritesAlbumsBox = Hive.box(nameBox2);
    return _favouritesAlbumsBox.containsKey(albumId);
  }

  Future<List<Box>> _openBox() async {
    Box _favouritesArtistsBox = await Hive.openBox(nameBox1);
    Box _favouritesAlbumsBox = await Hive.openBox(nameBox2);
    boxList.add(_favouritesArtistsBox);
    boxList.add(_favouritesAlbumsBox);
    return boxList;
  }
}
