import 'dart:convert';

class MostLovedAlbumResponse {
  MostLovedAlbumResponse({
    required this.loved,
  });

  final List<Map<String, String>> loved;

  factory MostLovedAlbumResponse.fromJson(String str) =>
      MostLovedAlbumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MostLovedAlbumResponse.fromMap(Map<String, dynamic> json) =>
      MostLovedAlbumResponse(
        loved: List<Map<String, String>>.from(json["loved"].map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
      );

  Map<String, dynamic> toMap() => {
        "loved": List<dynamic>.from(loved.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
      };
}
