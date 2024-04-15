import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:desafio_flutter_hero/config/api_config.dart';
import 'package:desafio_flutter_hero/service/hero_api_service_interface.dart';
import 'package:http/http.dart' as http;

class HeroAPIService extends HeroAPIServiceInterface{

  final int limit = 4;
  final String endpoint = 'https://gateway.marvel.com:443/v1/public/characters';

  @override
  Future<dynamic> fetchData(String? name, int page) async {

    var timeStamp = DateTime.now().toIso8601String();
    var hash = generateHash(timeStamp); 
    int offset = (page-1) * limit;

    String route = '$endpoint?apikey=$apiKey&hash=$hash&ts=$timeStamp&limit=$limit&offset=$offset';

    if(name!=null && name.isNotEmpty){
      route += '&nameStartsWith=$name';
    } 

    var dataURL = Uri.parse(route);
    http.Response response = await http.get(dataURL);

    if(response.statusCode == 200){
      var responseJson = jsonDecode(response.body);
      return responseJson;
    }else{
      return Future.value(List.empty());
    }
  }

  String generateHash(String time){
    var input = time+privateKey+apiKey;
    return md5.convert(utf8.encode(input)).toString();
  }
}
