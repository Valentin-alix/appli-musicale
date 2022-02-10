import 'package:appli_musical/model/artist_response.dart';
import 'package:dio/dio.dart';

class TheAudioDbApi {
  static const String _apiKey = "523532";
  final String _url =
      "https://theaudiodb.com/api/v1/json/$_apiKey/search.php?s=";
  late Dio _dio;

  TheAudioDbApi() {
    _dio = Dio();
  }

  Future<List<ArtistElement>?> fetchArtistDatas(String artistName) async {
    try {
      Response response = await _dio.get(_url + artistName);
      ArtistResponse artistResponse = ArtistResponse.fromJson(response.data);
      return artistResponse.artist;
    } on DioError catch (e) {
      print(e);
    }
  }
}
