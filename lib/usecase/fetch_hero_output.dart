

import 'package:desafio_flutter_hero/dto/hero_dto.dart';

class FetchHeroOutPut{

  final List<HeroDTO> heroes;
  final int count;

  FetchHeroOutPut({required this.heroes, required this.count});
}