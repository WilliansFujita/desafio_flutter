import 'package:desafio_flutter_hero/components/list_characters.dart';
import 'package:desafio_flutter_hero/components/pagination_navigation_bar.dart';
import 'package:desafio_flutter_hero/components/searchbar.dart';
import 'package:desafio_flutter_hero/components/texttittle.dart';
import 'package:desafio_flutter_hero/dto/hero_dto.dart';
import 'package:desafio_flutter_hero/usecase/heroes/fetch_all/fetch_hero_input.dart';
import 'package:desafio_flutter_hero/usecase/heroes/fetch_all/fetch_hero_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;


class InitialScreen extends StatefulWidget {
  const InitialScreen({
    super.key,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  List<HeroDTO> heroes = [];
  int page = 1;
  String searchName = '';
  int finalPage = 1;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextTitle()),
      body: SizedBox(
        height: 640,
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: SearchHeroBar((novaBusca){
                  setState(() {
                    if(searchName != novaBusca){
                      page=1;
                      searchName = novaBusca;
                      loadData();
                    }
                    
                  });
                }),
              ),
              ListCharacters(heroes)
            ],
          ),
        ),
      ),
      bottomNavigationBar: PaginationNavigationBar(page, finalPage, (nextPage) {
        setState(() {
          if (nextPage > 0 && nextPage != page && nextPage<=finalPage) {
            page = nextPage;
            loadData();
          }
        });
      }),
    );
  }

  Future<void> loadData() async {

    var input = FetchHeroInput(page: page, searchName: searchName);

    dependency<FetchHeroUseCase>()
    .execute(input)
    .then((output) => {
      setState(() {
        heroes = output.heroes;
        finalPage = output.finalPage;
      })
    });

  }
}
