import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/artist_response.dart';
import 'package:http/http.dart' as http;

class ArtistServices {
  Future<ArtistResponse> fetchArtisteByName(String artistName) async {
    final response = await http
        .get(Uri.parse(ApiConstants.BASE_URL + "search.php?s=" + artistName));
    if (response.statusCode == 200) {
      return ArtistResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load artiste by name');
    }
  }

  Future<ArtistResponse> fetchArtistById(String artistId) async {
    final response = await http.get(Uri.parse(
        ApiConstants.BASE_URL + "artist.php?i=" + artistId.toString()));
    if (response.statusCode == 200) {
      return ArtistResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load artiste by id');
    }
  }
}
