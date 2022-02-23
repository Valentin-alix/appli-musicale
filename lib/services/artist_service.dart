import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/artist_response.dart';
import 'package:http/http.dart' as http;

class ArtistServices {
  Future<ArtistResponse> fetchArtiste(String artistName) async {
    final response = await http
        .get(Uri.parse(ApiConstants.BASE_URL + "search.php?s=" + artistName));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ArtistResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load artiste');
    }
  }
}
