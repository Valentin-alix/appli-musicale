import 'dart:convert';

class ArtistResponse {
  ArtistResponse({
    required this.artist,
  });

  final List<ArtistElement>? artist;

  factory ArtistResponse.fromRawJson(String str) =>
      ArtistResponse.fromJson(json.decode(str));

  factory ArtistResponse.fromJson(Map<String, dynamic> json) => ArtistResponse(
        artist: json["artists"] == null
            ? null
            : List<ArtistElement>.from(
                json["artists"].map((x) => ArtistElement.fromJson(x))),
      );
}

class ArtistElement {
  ArtistElement({
    this.idArtist,
    this.strArtist,
    this.strCountry,
    this.strArtistFanart2,
    this.strBiographyEN,
    this.strArtistThumb,
  });

  final String? idArtist;
  final String? strArtist;
  final String? strCountry;
  final String? strArtistFanart2;
  final String? strBiographyEN;
  final String? strArtistThumb;

  factory ArtistElement.fromRawJson(String str) =>
      ArtistElement.fromJson(json.decode(str));

  factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
      strArtist: json["strArtist"],
      strCountry: json["strCountry"],
      strArtistFanart2: json["strArtistFanart2"],
      strBiographyEN: json["strBiographyEN"],
      idArtist: json["idArtist"],
      strArtistThumb: json["strArtistThumb"]);
}
