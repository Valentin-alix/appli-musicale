import 'package:appli_musical/model/artist.dart';
import 'package:dio/dio.dart';

class TheAudioDbApi {
  static String _apiKey = "523532";
  String _url = "https://theaudiodb.com/api/v1/json/$_apiKey/search.php?s=";
  late Dio _dio;

  TheAudioDbApi() {
    _dio = Dio();
  }

  Future<List<ArtistElement>?> fetchArtistDatas(String artistName) async {
    try {
      Response response = await _dio.get(_url + artistName);
      Artist artist = Artist.fromJson(response.data);
      return artist.artist;
    } on DioError catch (e) {
      print(e);
    }
  }
}
