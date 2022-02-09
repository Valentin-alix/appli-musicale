import 'dart:convert';

class Artist {
  Artist({
    required this.artist,
  });

  final List<ArtistElement>? artist;

  factory Artist.fromRawJson(String str) => Artist.fromJson(json.decode(str));

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        artist: json["artists"] == null
            ? null
            : List<ArtistElement>.from(
                json["artists"].map((x) => ArtistElement.fromJson(x))),
      );
}

class ArtistElement {
  ArtistElement({
    required this.strArtist,
    required this.strCountry,
    required this.strArtistFanart2,
  });

  final String strArtist;
  final String strCountry;
  final String strArtistFanart2;

  factory ArtistElement.fromRawJson(String str) =>
      ArtistElement.fromJson(json.decode(str));

  factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
        strArtist: json["strArtist"],
        strCountry: json["strCountry"],
        strArtistFanart2: json["strArtistFanart2"],
      );
}
