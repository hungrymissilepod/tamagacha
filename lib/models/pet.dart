import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'pet.g.dart';

@JsonSerializable(explicitToJson: true)
class Pet extends Equatable {
  Pet({
    required this.name,
    required this.weight,
    required this.file,
    this.isGif = false,
    required this.rarity,
    required this.hungerDecrement,
    this.uuid,
    this.hunger,
    this.timeAddedMilliseconds,
  });

  final String name;
  final double weight;
  final String file;
  final bool isGif;
  final String rarity;

  @JsonKey(name: 'hunger_decrement')
  final double hungerDecrement;
  String? uuid;
  double? hunger;

  /// the date time when user got this pet in milliseconds
  int? timeAddedMilliseconds;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);

  @override
  List<Object?> get props => [name, weight, file, isGif, rarity, uuid, hungerDecrement, hunger, timeAddedMilliseconds];

  factory Pet.clone(Pet original) {
    Map<String, dynamic> map = original.toJson();
    Pet clone = Pet.fromJson(map);
    return clone;
  }

  double _rarityMultiplier() {
    final PetRarity petRarity = PetRarity.values.byName(rarity);
    switch (petRarity) {
      case PetRarity.common:
        return 1;
      case PetRarity.uncommon:
        return 1.1;
      case PetRarity.infrequent:
        return 1.3;
      case PetRarity.rare:
        return 1.5;
      case PetRarity.unique:
        return 1.7;
      case PetRarity.legendary:
        return 2.0;
      default:
        return 1;
    }
  }

  int sellValue() {
    double rarityFactor = _rarityMultiplier();

    /// Calculate number of days the pet has been kept
    DateTime dayAdded = DateTime.fromMillisecondsSinceEpoch(timeAddedMilliseconds!);
    int daysKeptPet = DateTime.now().difference(dayAdded).inDays;
    if (daysKeptPet == 0) {
      daysKeptPet = 1;
    }
    double daysKeptFactor = daysKeptPet * 1.05;

    int basePetValue = 100;

    double value = hunger! * rarityFactor * daysKeptFactor * 100;
    value = value * 0.8;
    return value.toInt();
  }

  String status() {
    if (hunger! <= 0.0) {
      return 'Dead';
    }

    if (hunger! <= 0.2) {
      return 'Starving';
    }

    if (hunger! <= 0.5) {
      return 'Hungry';
    }
    return 'Happy';
  }
}

enum PetRarity { common, uncommon, infrequent, rare, unique, legendary }

Color rarityColor(String rarity) {
  final PetRarity petRarity = PetRarity.values.byName(rarity);
  switch (petRarity) {
    case PetRarity.common:
      return Colors.white;
    case PetRarity.uncommon:
      return Colors.grey;
    case PetRarity.infrequent:
      return Colors.blue;
    case PetRarity.rare:
      return Colors.purple;
    case PetRarity.unique:
      return Colors.red;
    case PetRarity.legendary:
      return Colors.orange;
    default:
      return Colors.white;
  }
}
