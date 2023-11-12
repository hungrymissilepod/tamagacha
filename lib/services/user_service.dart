import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class UserService with ListenableServiceMixin {
  final HiveService _hiveService = locator<HiveService>();
  final UserPetsService _userPetsService = locator<UserPetsService>();

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
    await _userPetsService.loadPets();

    allPets = await _loadAllPets();

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

  Future<Pets> _loadAllPets() async {
    final dynamic data = await rootBundle.loadString('assets/configs/all_pets.json');
    if (data != null) {
      return Pets.fromJson(json.decode(data));
    }
    return allPets;
  }

  bool canSpinWheel() {
    if (credits < spinCost) return false;
    if (_userPetsService.pets.pets.length >= maxPets) return false;
    return true;
  }
}
