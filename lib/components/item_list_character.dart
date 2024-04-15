import 'package:desafio_flutter_hero/components/hero_image.dart';
import 'package:desafio_flutter_hero/screens/details_screen.dart';
import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemListCharacter extends StatelessWidget {
  final int heroId;
  final String name;
  final String photoPath;
  final String description;

  const ItemListCharacter(this.heroId, this.name, this.photoPath,this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => DetailScreen(name,description,photoPath))));
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: HeroImage(photoPath),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 21,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 360,
            height: 2,
            color: CustomColorTheme.customRed,
          )
        ],
      ),
    );
  }
}
