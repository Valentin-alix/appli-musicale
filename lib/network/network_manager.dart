class NetworkManager {
  static final String _baseUrl = 'https://www.theaudiodb.com/';
  static final String _basePath = '/api/v1/json/523532/';

  final String apiKey;

  const NetworkManager(this.apiKey);

  /*Future<TravelTimesResponse> travelTimes(
    String artiste, {
    Set<TravelTimeTypeRequest>? types,
  }) async {
    URIBuilder builder = URIBuilder(_baseUrl, _basePath, 'traveltimes')
      ..addQuery('start', start)
      ..addQuery('end', end);

    if (types != null && types.isNotEmpty) {
      builder.addQuery('traveltime_types', types.value);
    }

    http.Response response = await _sendGetRequest(builder);
    return TravelTimesResponse.fromJson(jsonDecode(response.body));
  }*/
}
