import 'package:desafio_flutter_hero/components/item_list_character.dart';
import 'package:desafio_flutter_hero/dto/hero_dto.dart';
import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';

class ListCharacters extends StatelessWidget {


  final List<HeroDTO> heroes;

  const ListCharacters(this.heroes,{super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
     
      children: [
        Container(
          width: 360,
          height: 30,
          alignment: AlignmentDirectional.center,
          color: CustomColorTheme.customRed,
          child: const Text(
            'Nome',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: heroes.map((hero) => ItemListCharacter(hero.name, hero.photoPath)).toList(),
        ),
      ],
    );
  }
}
