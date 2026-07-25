class CharacterFiltersEntity {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  const CharacterFiltersEntity({
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });

  CharacterFiltersEntity copyWith({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) {
    return CharacterFiltersEntity(
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