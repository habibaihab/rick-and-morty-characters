import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/home/character_card.dart';

class CharacterGridView extends StatelessWidget {
  const CharacterGridView({super.key, required this.charactersList});

  final List<CharacterEntity> charactersList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: charactersList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        mainAxisSpacing: 15.r,
        crossAxisSpacing: 15.r,
        childAspectRatio: 2/3
      ),
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CharacterCard(characterData: charactersList[index]);
      },);
  }
}
