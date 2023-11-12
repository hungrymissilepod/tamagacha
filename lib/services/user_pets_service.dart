import 'dart:convert';
import 'dart:math';

import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:uuid/uuid.dart';

class UserPetsService {
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

  double randomRange(num start, num end) => _random.nextDouble() * (end - start) + start;

  Future<void> savePet(Pet pet) async {
    if (pets.pets.length >= maxPets) return;
    pet.uuid = uuid.v1();
    pet.hunger = randomRange(0.2, 0.8);
    pets.pets.add(pet);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> deletePet(String petId) async {
    pets.pets.removeWhere((element) => element.uuid == petId);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> feedPet(String petId) async {
    int index = pets.pets.indexWhere((element) => element.uuid == petId);
    if (index != -1) {
      double? currentHunger = pets.pets[index].hunger;
      currentHunger = currentHunger! + foodAmount;
      pets.pets[index].hunger = currentHunger.clamp(0.0, 1.0);
    }
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }
}

extension DoubleRounding on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
