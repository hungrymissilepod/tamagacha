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
    this.uuid,
  });

  final String name;
  final double weight;
  final String file;
  final bool isGif;
  final String rarity;
  String? uuid;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);

  @override
  List<Object?> get props => [name, weight, file, isGif, rarity, uuid];

  factory Pet.clone(Pet original) {
    Map<String, dynamic> map = original.toJson();
    Pet clone = Pet.fromJson(map);
    return clone;
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
      return Colors.yellow;
    default:
      return Colors.white;
  }
}
