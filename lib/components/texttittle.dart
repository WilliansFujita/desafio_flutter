import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BUSCA',
              style: TextStyle(
                  fontSize: 16,
                  color: CustomColorTheme.customRed,
                  fontWeight: FontWeight.bold, ),
            ),
            Text(
              ' MARVEL',
              style: TextStyle(
                  fontSize: 16,
                  color: CustomColorTheme.customRed,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' TEST',
              style: TextStyle(
                  fontSize: 16, color: CustomColorTheme.customRed),
            ),
            Text(
              ' FRONT-END',
              style: TextStyle(
                  fontSize: 16, color: CustomColorTheme.customRed),
            )
          ],
        ),
        Row(
          
          children: [
            Container(
              color: CustomColorTheme.customRed,
              width: 54,
              height: 4,
             
            ),
          ],
        )
      ],
    );
  }
}
