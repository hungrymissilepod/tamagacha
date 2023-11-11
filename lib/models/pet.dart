import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet extends Equatable {
  const Pet({
    required this.name,
    required this.weight,
    required this.file,
    this.isGif = false,
  });

  final String name;
  final double weight;
  final String file;
  final bool isGif;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);

  @override
  List<Object?> get props => [name, weight, file, isGif];
}
