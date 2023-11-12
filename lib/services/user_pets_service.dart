import 'dart:convert';
import 'dart:math';

import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class UserPetsService with ListenableServiceMixin {
  final HiveService _hiveService = locator<HiveService>();

  final Uuid uuid = const Uuid();
  final Random _random = Random();

  Pets pets = Pets(pets: []);

  Future<void> loadPets() async {
    final dynamic data = await _hiveService.read(HiveKeys.pets);
    if (data != null) {
      pets = Pets.fromJson(json.decode(data));
      return;
    }
    pets = pets;
  }

  double randomRange(num start, num end) =>
      _random.nextDouble() * (end - start) + start;

  Future<void> savePet(Pet pet) async {
    if (pets.pets.length >= maxPets) return;
    pet.uuid = uuid.v1();
    pet.hunger = randomRange(0.2, 0.8);
    pet.timeAddedMilliseconds = DateTime.now().millisecondsSinceEpoch;
    pets.pets.add(pet);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> deletePet(String petId) async {
    pets.pets.removeWhere((element) => element.uuid == petId);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> feedPet(String petId) async {
    updatePetHunger(petId, foodAmount);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> checkPetHealth() async {
    /// Get the last time we checked our pets health
    final dynamic data =
        await _hiveService.read(HiveKeys.petHealthLastCheckTime);
    if (data == null) {
      _hiveService.write(HiveKeys.petHealthLastCheckTime,
          DateTime.now().millisecondsSinceEpoch);
      return;
    }

    int lastCheckMilliseconds = data as int;
    // this is the last time we did a health check
    DateTime lastCheckDateTime =
        DateTime.fromMillisecondsSinceEpoch(lastCheckMilliseconds);

    DateTime now = DateTime.now();
    // now = now.subtract(Duration(minutes: 900));

    int diffMinutes = now.difference(lastCheckDateTime).inMinutes;

    int numHealthChecksOverdue =
        (diffMinutes ~/ healthCheckIntervalMinutes).abs();
    print('numHealthChecksOverdue: $numHealthChecksOverdue');

    for (Pet pet in pets.pets) {
      updatePetHunger(
          pet.uuid!, -(pet.hungerDecrement * numHealthChecksOverdue));
    }

    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
    await _hiveService.write(
        HiveKeys.petHealthLastCheckTime, DateTime.now().millisecondsSinceEpoch);
    await loadPets();
    notifyListeners();
  }

  Future<void> updatePetHunger(String petId, double value) async {
    int index = pets.pets.indexWhere((element) => element.uuid == petId);
    if (index != -1) {
      double? currentHunger = pets.pets[index].hunger;
      currentHunger = currentHunger! + value;
      pets.pets[index].hunger = currentHunger.clamp(0.0, 1.0);
    }
  }
}

extension DoubleRounding on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
