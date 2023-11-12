import 'dart:io';
import 'package:flutter_app_template/app/app.logger.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

const int spinCost = 1000;
const int maxPets = 10;
const double foodAmount = 0.2; // amount food replenishes hunger
const int foodCost = 125;
const int healthCheckIntervalMinutes = 60;

/// how many minutes between health checks

class HiveKeys {
  static const String pets = 'pets';
  static const String credits = 'credits';

  /// The number of lifetime steps that we are using as our base level
  static const String baseLevelSteps = 'baseLevelSteps';

  /// The last time (datetime) that we checked user's pets health
  static const String petHealthLastCheckTime = 'petHealthLastCheckTime';
}

class HiveService {
  late Box _box;
  final String _boxId = 'box';
  final Logger _logger = getLogger('HiveService');

  Future<void> init() async {
    if (Hive.isBoxOpen(_boxId)) return;
    _logger.i('init hive');
    final Directory docDir = await getApplicationDocumentsDirectory();
    final String path = join(docDir.path, _boxId);
    Hive.init(path);
    _box = await Hive.openBox(_boxId);
  }

  Future<void> write(String key, dynamic value) async {
    if (!_box.isOpen) {
      await init();
    }
    await _box.put(key, value);
  }

  Future<dynamic> read(String key, {dynamic defaultValue}) async {
    if (!_box.isOpen) {
      await init();
    }
    return await _box.get(key, defaultValue: defaultValue);
  }

  Future<void> clear() async {
    await Hive.close();
    await Hive.deleteFromDisk();
  }
}
