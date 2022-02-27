import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'album.g.dart';

@HiveType(typeId: 1)
class Album extends HiveObject {
  @HiveField(0)
  final String albumId;

  @HiveField(1)
  final String strAlbum;

  @HiveField(2)
  final String strArtist;

  @HiveField(3)
  final String strAlbumThumb;

  @override
  String toString() {
    return strArtist;
  }

  Album(this.albumId, this.strAlbum, this.strArtist, this.strAlbumThumb);
}
