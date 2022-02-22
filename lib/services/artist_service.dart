import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/artist_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ArtistService {
  final String _url = ApiConstants.BASE_URL + "search.php?s=";
  late Dio _dio;

  artistData() {
    _dio = Dio();
  }

  Future<List<ArtistElement>?> fetchArtistDatas(String artistName) async {
    try {
      Response response = await _dio.get(_url + artistName);
      ArtistResponse artistResponse = ArtistResponse.fromJson(response.data);
      return artistResponse.artist;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
