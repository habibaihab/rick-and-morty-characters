import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';

class CharacterFiltersModel extends CharacterFiltersEntity{
  const CharacterFiltersModel({
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
  });

  CharacterFiltersModel copyWith({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) {
    return CharacterFiltersModel(
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
    );
  }
  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> query = {};

    if (name != null && name!.trim().isNotEmpty) {
      query["name"] = name;
    }

    if (status != null && status!.trim().isNotEmpty) {
      query["status"] = status;
    }

    if (species != null && species!.trim().isNotEmpty) {
      query["species"] = species;
    }

    if (type != null && type!.trim().isNotEmpty) {
      query["type"] = type;
    }

    if (gender != null && gender!.trim().isNotEmpty) {
      query["gender"] = gender;
    }

    return query;
  }

}