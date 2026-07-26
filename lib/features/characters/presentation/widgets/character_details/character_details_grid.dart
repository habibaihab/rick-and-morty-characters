import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';

import '../../../../../core/utils/status_color.dart';
import 'info_card.dart';

class CharacterDetailsGrid extends StatelessWidget {
  const CharacterDetailsGrid({super.key, required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      children: [
        InfoCard(
          icon: Icons.science_rounded,
          title: "Species",
          value: character.species,
          accentColor: const Color(0xFF6C63FF),
        ),
        InfoCard(
          icon: Icons.person_rounded,
          title: "Gender",
          value: character.gender,
          accentColor: const Color(0xFF00C2A8),
        ),
        InfoCard(
          icon: Icons.favorite_rounded,
          title: "Status",
          value: character.status,
          accentColor: getStatusColor(character.status),
        ),
        InfoCard(
          icon: Icons.category_rounded,
          title: "Type",
          value:
          character.type.isEmpty ? "Unknown" : character.type,
          accentColor: const Color(0xFFFF8A5C),
        ),
      ],
    );
  }
}
