import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/track_response.dart';
import 'package:http/http.dart' as http;

class TrackService {
  Future<TrackResponse> fetchTrackByIdAlbum(String idAlbum) async {
    final response = await http
        .get(Uri.parse(ApiConstants.BASE_URL + "track.php?m=" + idAlbum));
    if (response.statusCode == 200) {
      return TrackResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tracks by id album');
    }
  }

  Future<TrackResponse> fetchMostLovedTrackByIdArtiste(
      String nameArtist) async {
    final response = await http.get(
        Uri.parse(ApiConstants.BASE_URL + "track-top10.php?s=" + nameArtist));
    if (response.statusCode == 200) {
      return TrackResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tracks by name artist');
    }
  }
}
