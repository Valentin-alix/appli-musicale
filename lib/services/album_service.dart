import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/album_response.dart';
import 'package:http/http.dart' as http;

class AlbumServices {
  Future<AlbumResponse> searchAlbum(String artistName) async {
    final response = await http.get(
        Uri.parse(ApiConstants.BASE_URL + "searchalbum.php?s=" + artistName));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AlbumResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load artiste');
    }
  }

  // Future<AlbumResponse> getAlbum(String idAlbum) async {
  //   final response = await http
  //       .get(Uri.parse(ApiConstants.BASE_URL + "album.php?m=" + idAlbum));
  //
  //   if (response.statusCode == 200) {
  //     return ....fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load artiste');
  //   }
  // }
}
