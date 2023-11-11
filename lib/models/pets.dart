import 'package:equatable/equatable.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pets.g.dart';

@JsonSerializable()
class Pets extends Equatable {
  const Pets({required this.pets});

  final List<Pet> pets;

  factory Pets.fromJson(Map<String, dynamic> json) => _$PetsFromJson(json);

  Map<String, dynamic> toJson() => _$PetsToJson(this);

  @override
  List<Object?> get props => [pets];
}
