import 'package:desafio_flutter_hero/dto/hero_dto.dart';
import 'package:desafio_flutter_hero/service/hero_api_service_interface.dart';
import 'package:desafio_flutter_hero/usecase/fectch_hero_input.dart';
import 'package:desafio_flutter_hero/usecase/fetch_hero_output.dart';

class FetchHeroUseCase{

  final HeroAPIServiceInterface apiService;

  FetchHeroUseCase(this.apiService);


  Future<FetchHeroOutPut> execute(FetchHeroInput input) async{

    try{
      dynamic responseJson = await apiService.fetchData(input.searchName, input.page);
      var heroes = HeroDTO.fromJsonList(responseJson["data"]["results"]);
      return FetchHeroOutPut(heroes: heroes, count: responseJson["data"]["total"]);
    }catch(e){
      throw Exception("Error on fetch.");
    }
    
  }
}