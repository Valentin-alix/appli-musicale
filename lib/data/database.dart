import 'package:application_musicale/models/artist.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseManager {
  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app');
  }

  Future<void> addArtist(Artist artist) {
    return _box.add(artist);
  }

  Artist? getArtist(int index) {
    return _box.getAt(index);
  }
}
