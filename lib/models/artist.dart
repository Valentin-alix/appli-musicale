import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Artist extends HiveObject {
  @HiveField(0)
  final String artistId;

  @HiveField(1)
  final String strArtist;

  @HiveField(2)
  final String strArtistThumb;

  Artist(this.artistId, this.strArtist, this.strArtistThumb);
}
