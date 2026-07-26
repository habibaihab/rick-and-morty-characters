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

  static const _noChange = Object();

  CharacterFiltersEntity copyWith({
    Object? name = _noChange,
    Object? status = _noChange,
    Object? species = _noChange,
    Object? type = _noChange,
    Object? gender = _noChange,
  }) {
    return CharacterFiltersEntity(
      name: name == _noChange ? this.name : name as String?,
      status: status == _noChange ? this.status : status as String?,
      species: species == _noChange ? this.species : species as String?,
      type: type == _noChange ? this.type : type as String?,
      gender: gender == _noChange ? this.gender : gender as String?,
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