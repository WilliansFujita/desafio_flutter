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
                  color: Color.fromRGBO(212, 20, 26, 100),
                  fontWeight: FontWeight.bold, ),
            ),
            Text(
              ' MARVEL',
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(212, 20, 26, 100),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' TEST',
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(212, 20, 26, 100)),
            ),
            Text(
              ' FRONT-END',
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(212, 20, 26, 100)),
            )
          ],
        ),
        Row(
          
          children: [
            Container(
              color: const Color.fromRGBO(212, 20, 26, 100),
              width: 54,
              height: 4,
             
            ),
          ],
        )
      ],
    );
  }
}
