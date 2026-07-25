import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity{
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.image});

  factory CharacterModel.fromJson(Map<String,dynamic> json){
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
    );
  }


}