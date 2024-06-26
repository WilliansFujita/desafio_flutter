import 'package:desafio_flutter_hero/dto/hero_dto.dart';
import 'package:desafio_flutter_hero/service/hero_api_service_interface.dart';
import 'package:desafio_flutter_hero/usecase/heroes/fetch_all/fetch_hero_input.dart';
import 'package:desafio_flutter_hero/usecase/heroes/fetch_all/fetch_hero_output.dart';

class FetchHeroUseCase{

  final HeroAPIServiceInterface apiService;

  FetchHeroUseCase(this.apiService);


  Future<FetchHeroOutPut> execute(FetchHeroInput input) async{

    try{
      dynamic responseJson = await apiService.fetchData(input.searchName, input.page);
      var heroes = HeroDTO.fromJsonList(responseJson["data"]["results"]);
      double finalPage = responseJson["data"]["total"]!=0 ? responseJson["data"]["total"] / 4: 0;
      return FetchHeroOutPut(heroes: heroes, count: responseJson["data"]["total"], finalPage:finalPage.floor() );
    }catch(e){
      throw Exception("Error on fetch.");
    }
    
  }
}