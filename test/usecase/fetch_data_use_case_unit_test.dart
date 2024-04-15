import 'package:desafio_flutter_hero/service/hero_api_service_interface.dart';
import 'package:desafio_flutter_hero/usecase/fectch_hero_input.dart';
import 'package:desafio_flutter_hero/usecase/fectch_hero_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_data_use_case_unit_test.mocks.dart';

@GenerateMocks([HeroAPIServiceInterface])
void main() {
  test('should fetch data', () async {
    final heroServiceMock = MockHeroAPIServiceInterface();

    when(heroServiceMock.fetchData('', 1)).thenAnswer((_) async => {
          "data": {
            "total": 1,
            "results": [
              {
                "id": 1011334,
                "name": "3-D Man",
                "description": "",
                "thumbnail": {
                  "path":
                      "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                  "extension": "jpg"
                }
              }
            ]
          }
        });

    var useCase = FetchHeroUseCase(heroServiceMock);

    var input = FetchHeroInput(page: 1, searchName: '');

    var outPut = await useCase.execute(input);

    expect(outPut.count, 1);
    expect(outPut.heroes[0].id,1011334 );

  });
}
