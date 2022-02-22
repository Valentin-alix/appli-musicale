import 'dart:convert';

class MostLovedTrackResponse {
  MostLovedTrackResponse({
    required this.loved,
  });

  final List<Map<String, String>> loved;

  factory MostLovedTrackResponse.fromJson(String str) =>
      MostLovedTrackResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MostLovedTrackResponse.fromMap(Map<String, dynamic> json) =>
      MostLovedTrackResponse(
        loved: List<Map<String, String>>.from(json["loved"].map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
      );

  Map<String, dynamic> toMap() => {
        "loved": List<dynamic>.from(loved.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
      };
}
