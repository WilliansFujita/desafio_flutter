import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';

class SearchHeroBar extends StatelessWidget {
  final Function onChange;

  const SearchHeroBar(this.onChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nome do Personagem',
          style:
              TextStyle(fontSize: 16, color:CustomColorTheme.customRed),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
              height: 50,
              child: TextField(
                onChanged: (text) {
                  onChange(text);
                },
                style: const TextStyle(height: 0.2),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )),
        ),
      ],
    );
  }
}
