// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

class AlbumResponse {
  AlbumResponse({
    required this.album,
  });

  late final List<AlbumElement>? album;

  factory AlbumResponse.fromRawJson(String str) =>
      AlbumResponse.fromJson(json.decode(str));

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
        album: json["album"] == null
            ? null
            : List<AlbumElement>.from(
                json["album"].map((x) => AlbumElement.fromJson(x))),
      );
}

class AlbumElement {
  AlbumElement({
    required this.idAlbum,
    required this.idArtist,
    required this.idLabel,
    required this.strAlbum,
    required this.strAlbumStripped,
    required this.strArtist,
    required this.strArtistStripped,
    required this.intYearReleased,
    required this.strStyle,
    required this.strGenre,
    required this.strLabel,
    required this.strReleaseFormat,
    required this.intSales,
    required this.strAlbumThumb,
  });

  final String idAlbum;
  final String idArtist;
  final String idLabel;
  final String strAlbum;
  final String strAlbumStripped;
  final String strArtist;
  final String strArtistStripped;
  final String intYearReleased;
  final String strStyle;
  final String strGenre;
  final String strLabel;
  final String strReleaseFormat;
  final String intSales;
  final String strAlbumThumb;

  factory AlbumElement.fromRawJson(String str) =>
      AlbumElement.fromJson(json.decode(str));

  factory AlbumElement.fromJson(Map<String, dynamic> json) => AlbumElement(
        idAlbum: json["idAlbum"],
        idArtist: json["idArtist"],
        idLabel: json["idLabel"],
        strAlbum: json["strAlbum"],
        strAlbumStripped: json["strAlbumStripped"],
        strArtist: json["strArtist"],
        strArtistStripped: json["strArtistStripped"],
        intYearReleased: json["intYearReleased"],
        strStyle: json["strStyle"],
        strGenre: json["strGenre"],
        strLabel: json["strLabel"],
        strReleaseFormat: json["strReleaseFormat"],
        intSales: json["intSales"],
        strAlbumThumb: json["strAlbumThumb"],
      );
}
