import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/models/pets.dart';
import 'package:flutter_app_template/services/hive_service.dart';

class UserService {
  final HiveService _hiveService = locator<HiveService>();

  late Pets? pets;

  // TODO: move this somewhere else
  late Pets? allPets;

  Future<void> load() async {
    pets = await _loadPets();
    if (pets != null) {
      for (Pet p in pets!.pets) {
        print('my pet: ${p.name}');
      }
    }

    allPets = await _loadAllPets();

    if (allPets != null) {
      for (Pet p in allPets!.pets) {
        print('available pet: ${p.name}');
      }
    }
  }

  Future<Pets?> _loadPets() async {
    final dynamic data = await _hiveService.read(HiveKeys.pets);
    if (data != null) {
      return Pets.fromJson(json.decode(data));
    }
    return null;
  }

  Future<Pets?> _loadAllPets() async {
    final dynamic data = await rootBundle.loadString('assets/configs/all_pets.json');
    if (data != null) {
      return Pets.fromJson(json.decode(data));
    }
    return null;
  }

  Future<void> savePet(Pet pet) async {
    pets?.pets.add(pet);
    await _hiveService.write(HiveKeys.pets, pets?.toJson());
  }
}
