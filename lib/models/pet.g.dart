// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      name: json['name'] as String,
      weight: (json['weight'] as num).toDouble(),
      file: json['file'] as String,
      isGif: json['isGif'] as bool? ?? false,
      rarity: json['rarity'] as String,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'file': instance.file,
      'isGif': instance.isGif,
      'rarity': instance.rarity,
      'uuid': instance.uuid,
    };
