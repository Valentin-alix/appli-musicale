import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Album extends HiveObject {
  @HiveField(0)
  final String albumId;

  @HiveField(1)
  final String strArtist;

  @HiveField(2)
  final String strAlbumThumb;

  Album(this.albumId, this.strArtist, this.strAlbumThumb);
}
