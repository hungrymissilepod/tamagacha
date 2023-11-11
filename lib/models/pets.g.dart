// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pets _$PetsFromJson(Map<String, dynamic> json) => Pets(
      pets: (json['pets'] as List<dynamic>)
          .map((e) => Pet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PetsToJson(Pets instance) => <String, dynamic>{
      'pets': instance.pets,
    };
