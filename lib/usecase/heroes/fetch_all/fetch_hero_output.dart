

import 'package:desafio_flutter_hero/dto/hero_dto.dart';

class FetchHeroOutPut{

  final List<HeroDTO> heroes;
  final int count;
  final int finalPage;

  FetchHeroOutPut({required this.heroes, required this.count, required this.finalPage});
}