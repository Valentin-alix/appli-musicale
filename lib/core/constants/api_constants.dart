class ApiConstants {
  ApiConstants._();

  static const String API_KEY = "523532";
  static const String BASE_URL = 'https://theaudiodb.com/api/v1/json/$API_KEY/';

  // Return The top 50 Most Loved Tracks of Alltime
  static const String PATH_MOST_LOVED_TRACK = 'mostloved.php?format=track';

  // Return The top 10 Most Loved Albums of Alltime
  static const String PATH_MOST_LOVED_ALBUM = 'mostloved.php?format=album';
}
