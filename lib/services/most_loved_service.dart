import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/most_loved_album_response.dart';
import 'package:application_musicale/models/most_loved_track_response.dart';
import 'package:http/http.dart' as http;

class MostLovedService {
  Future<MostLovedAlbumResponse> getMostLovedAlbums() async {
    final response = await http.get(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.PATH_MOST_LOVED_ALBUM));

    if (response.statusCode == 200) {
      return MostLovedAlbumResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load most loved album');
    }
  }

  Future<MostLovedTrackResponse> getMostLovedTracks() async {
    final response = await http.get(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.PATH_MOST_LOVED_TRACK));

    if (response.statusCode == 200) {
      return MostLovedTrackResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load most loved track');
    }
  }
}
