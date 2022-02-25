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
  AlbumElement(
      {this.idAlbum,
      this.idArtist,
      this.idLabel,
      this.strAlbum,
      this.strAlbumStripped,
      this.strArtist,
      this.strArtistStripped,
      this.intYearReleased,
      this.strStyle,
      this.strGenre,
      this.strLabel,
      this.strReleaseFormat,
      this.intSales,
      this.strAlbumThumb,
      this.intScoreVotes,
      this.intScore,
      this.strDescriptionEN});

  final String? intScore;
  final String? intScoreVotes;
  final String? idAlbum;
  final String? idArtist;
  final String? idLabel;
  final String? strAlbum;
  final String? strAlbumStripped;
  final String? strArtist;
  final String? strArtistStripped;
  final String? intYearReleased;
  final String? strStyle;
  final String? strGenre;
  final String? strLabel;
  final String? strReleaseFormat;
  final String? intSales;
  final String? strAlbumThumb;
  final String? strDescriptionEN;

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
      intScoreVotes: json["intScoreVotes"],
      intScore: json["intScore"],
      strDescriptionEN: json["strDescriptionEN"]);
}
