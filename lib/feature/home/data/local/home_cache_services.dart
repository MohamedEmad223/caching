import 'package:film_app/core/local/hive_cache_services.dart';
import 'package:film_app/feature/home/data/models/query_ships_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeCacheService implements HiveCacheService<QueryShipsModel> {
  static const String shipsBoxName = 'shipsBox';
  Box<QueryShipsModel>? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(shipsBoxName)) {
      await Hive.openBox<QueryShipsModel>(shipsBoxName);
    }
  }

  Box<QueryShipsModel> _getBox() {
    if (_box == null || !_box!.isOpen) {
      if (!Hive.isBoxOpen(shipsBoxName)) {
        throw Exception(
          'Hive box not initialized. Call HomeCacheService.init() first.',
        );
      }
      _box = Hive.box<QueryShipsModel>(shipsBoxName);
    }
    return _box!;
  }

  @override
  Future<void> cacheItem(String key, QueryShipsModel item) async {
    final box = _getBox();
    await box.put(key, item);
  }

  @override
  QueryShipsModel? getCachedItem(String key) {
    final box = _getBox();
    return box.get(key);
  }

  @override
  Future<void> clearCachedItem(String key) async {
    final box = _getBox();
    await box.delete(key);
  }

  @override
  Future<void> clearAll() async {
    final box = _getBox();
    await box.clear();
  }

  @override
  bool hasItem(String key) {
    final box = _getBox();
    return box.containsKey(key);
  }

  Future<void> cacheShips(QueryShipsModel ships) async {
    await cacheItem('cachedShips', ships);
  }

  QueryShipsModel? getCachedShips() {
    return getCachedItem('cachedShips');
  }

  Future<void> clearCachedShips() async {
    await clearCachedItem('cachedShips');
  }

  Future<void> cacheShipsByPage(int page, QueryShipsModel ships) async {
    await cacheItem('ships_page_$page', ships);
  }

  QueryShipsModel? getCachedShipsByPage(int page) {
    return getCachedItem('ships_page_$page');
  }
}
