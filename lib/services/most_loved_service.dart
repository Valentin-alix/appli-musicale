import 'package:application_musicale/api/api.dart';
import 'package:application_musicale/core/constants/api_constants.dart';
import 'package:application_musicale/models/most_loved_album_response.dart';
import 'package:application_musicale/models/most_loved_track_response.dart';

class MostLovedService {
  static MostLovedService? _instance;

  factory MostLovedService() => _instance ??= MostLovedService._();

  MostLovedService._();

  Future<MostLovedAlbumResponse> getMostLovedAlbums() async {
    var response = await Api().dio.get(ApiConstants.PATH_MOST_LOVED_ALBUM);

    return MostLovedAlbumResponse.fromJson(response.data);
  }

  Future<MostLovedTrackResponse> getMostLovedTracks() async {
    var response = await Api().dio.get(ApiConstants.PATH_MOST_LOVED_TRACK);

    return MostLovedTrackResponse.fromJson(response.data);
  }
}
