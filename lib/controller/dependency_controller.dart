
import 'package:desafio_flutter_hero/service/hero_api_service.dart';
import 'package:desafio_flutter_hero/service/hero_api_service_interface.dart';
import 'package:desafio_flutter_hero/usecase/heroes/fetch_all/fetch_hero_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

class DependencyController{

  static void startDependecy(){
    dependency.registerFactory<HeroAPIServiceInterface>(() => HeroAPIService());
    dependency.registerFactory<FetchHeroUseCase>(() => FetchHeroUseCase(dependency<HeroAPIServiceInterface>()));
  }
}