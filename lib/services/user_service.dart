import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class UserService with ListenableServiceMixin {
  final HiveService _hiveService = locator<HiveService>();

  final Uuid uuid = const Uuid();
  final Random _random = Random();

  Pets pets = Pets(pets: []);

  // TODO: move this somewhere else
  Pets allPets = Pets(pets: []);

  int credits = 0;

  void addCredits(int num) {
    credits += num;
    _hiveService.write(HiveKeys.credits, credits);
  }

  void removeCredits(int num) {
    credits -= num;
    _hiveService.write(HiveKeys.credits, credits);
  }

  Future<void> calculateInitialSteps(int lifeTimeSteps) async {
    _hiveService.write(HiveKeys.baseLevelSteps, lifeTimeSteps);
  }

  Future<void> updateBaseLevelSteps(int currentStepsLifeTimeSteps) async {
    final int? currentBaseLevelSteps = await _hiveService.read(HiveKeys.baseLevelSteps);

    if (currentBaseLevelSteps != null) {
      print('currentBaseLevelSteps: $currentBaseLevelSteps');
      final int diff = currentStepsLifeTimeSteps - currentBaseLevelSteps;
      print('diff: $diff');

      addCredits(diff);

      await _hiveService.write(HiveKeys.baseLevelSteps, currentBaseLevelSteps + diff);
    }
  }

  Future<void> load() async {
    pets = await _loadPets();
    // for (Pet p in pets.pets) {
    //   print('my pet: ${p.name}');
    // }

    allPets = await _loadAllPets();

    // for (Pet p in allPets.pets) {
    //   print('available pet: ${p.name}');
    // }
    credits = await _loadCredits();
  }

  Future<int> _loadCredits() async {
    final dynamic data = await _hiveService.read(HiveKeys.credits);
    if (data != null) {
      if (data is int) {
        return data;
      }
    }
    return 0;
  }

  Future<Pets> _loadPets() async {
    final dynamic data = await _hiveService.read(HiveKeys.pets);
    if (data != null) {
      return Pets.fromJson(json.decode(data));
    }
    return pets;
  }

  Future<Pets> _loadAllPets() async {
    final dynamic data = await rootBundle.loadString('assets/configs/all_pets.json');
    if (data != null) {
      return Pets.fromJson(json.decode(data));
    }
    return allPets;
  }

  double randomRange(num start, num end) => _random.nextDouble() * (end - start) + start;

  Future<void> savePet(Pet pet) async {
    if (pets.pets.length >= maxPets) return;
    pet.uuid = uuid.v1();
    pet.hunger = randomRange(0.2, 0.8);
    pets.pets.add(pet);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> deletePet(Pet pet) async {
    pets.pets.removeWhere((element) => element.uuid == pet.uuid);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  bool canSpinWheel() {
    if (credits < spinCost) return false;
    if (pets.pets.length >= maxPets) return false;
    return true;
  }
}

extension DoubleRounding on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
