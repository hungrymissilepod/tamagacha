import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:uuid/uuid.dart';

class UserService {
  final HiveService _hiveService = locator<HiveService>();

  final Uuid uuid = const Uuid();

  Pets pets = Pets(pets: []);

  // TODO: move this somewhere else
  Pets allPets = Pets(pets: []);

  Future<void> load() async {
    pets = await _loadPets();
    for (Pet p in pets.pets) {
      print('my pet: ${p.name}');
    }

    allPets = await _loadAllPets();

    for (Pet p in allPets.pets) {
      print('available pet: ${p.name}');
    }
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

  Future<void> savePet(Pet pet) async {
    pet.uuid = uuid.v4();
    pets.pets.add(pet);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }

  Future<void> deletePet(Pet pet) async {
    pets.pets.removeWhere((element) => element.uuid == pet.uuid);
    await _hiveService.write(HiveKeys.pets, json.encode(pets.toJson()));
  }
}
