import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemListCharacter extends StatelessWidget {
  final String name;
  final String photoPath;

  const ItemListCharacter(this.name, this.photoPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          photoPath,
                        ))),
              ),
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
    );
  }
}
