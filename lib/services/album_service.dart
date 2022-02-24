import 'dart:convert';

import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/album_response.dart';
import 'package:http/http.dart' as http;

class AlbumServices {
  /*Future<AlbumResponse> fetchAlbumByName(String artistName) async {
    final response = await http.get(
        Uri.parse(ApiConstants.BASE_URL + "searchalbum.php?s=" + artistName));

    if (response.statusCode == 200) {
      return AlbumResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album by name');
    }
  }*/

  Future<AlbumResponse> fetchAlbumById(String idAlbum) async {
    final response = await http
        .get(Uri.parse(ApiConstants.BASE_URL + "album.php?m=" + idAlbum));

    if (response.statusCode == 200) {
      return AlbumResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album by id');
    }
  }

  Future<AlbumResponse> fetchAllAlbumByArtistID(String artistId) async {
    final response = await http
        .get(Uri.parse(ApiConstants.BASE_URL + "album.php?i=" + artistId));
    if (response.statusCode == 200) {
      return AlbumResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load albums by artist id');
    }
  }
}
