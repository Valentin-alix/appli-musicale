// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

class AlbumResponse {
  AlbumResponse({
    required this.strAlbum,
    required this.strArtist,
    required this.intYearReleased,
    required this.strAlbumThumb,
  });

  final String strAlbum;
  final String strArtist;
  final String intYearReleased;
  final String strAlbumThumb;

  factory AlbumResponse.fromRawJson(String str) =>
      AlbumResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
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
