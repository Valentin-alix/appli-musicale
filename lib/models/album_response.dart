// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

class Album {
  Album({
    required this.strAlbum,
    required this.strArtist,
    required this.intYearReleased,
    required this.strAlbumThumb,
  });

  final String strAlbum;
  final String strArtist;
  final String intYearReleased;
  final String strAlbumThumb;

  factory Album.fromRawJson(String str) => Album.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        strAlbum: json["strAlbum"],
        strArtist: json["strArtist"],
        intYearReleased: json["intYearReleased"],
        strAlbumThumb: json["strAlbumThumb"],
      );

  Map<String, dynamic> toJson() => {
        "strAlbum": strAlbum,
        "strArtist": strArtist,
        "intYearReleased": intYearReleased,
        "strAlbumThumb": strAlbumThumb,
      };
}
