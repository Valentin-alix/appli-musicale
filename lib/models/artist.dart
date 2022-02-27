import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'artist.g.dart';

@HiveType(typeId: 2)
class Artist extends HiveObject {
  @HiveField(0)
  final String artistId;

  @HiveField(1)
  final String strArtist;

  @HiveField(2)
  final String strArtistThumb;

  @override
  String toString() {
    return strArtist;
  }

  Artist(this.artistId, this.strArtist, this.strArtistThumb);
}
