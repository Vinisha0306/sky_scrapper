import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:sky_scrapper/modal/api_modal.dart';
import 'package:http/http.dart' as http;

import '../modal/cityModal.dart';

class ApiCalling {
  ApiCalling._();
  static ApiCalling apiCalling = ApiCalling._();

  String api =
      'https://api.weatherapi.com/v1/current.json?key=65578899c53c48b999f121435240206';
  String cityapi = 'https://city-list.p.rapidapi.com/api/getCity/in';
  Logger logger = Logger();

  Future<Weather> getWeather({required String city}) async {
    Weather allWeather = Weather.demoWeather;

    http.Response response = await http.get(
      Uri.parse('$api&q=$city'),
    );

    if (response.statusCode == 200) {
      logger.i('code : ${response.statusCode}');
      Map data = jsonDecode(response.body);
      allWeather = Weather.fromJson(data as Map<String, dynamic>);
    }

    return allWeather;
  }

  Future<List<City>> getCity() async {
    List<City> allCity = [];

    http.Response response = await http.get(
      Uri.parse(cityapi),
      headers: {
        'X-RapidAPI-Key': '560709b69amsh10452e5f1d2a5e5p1a1a09jsn3d6027f9e6cb',
        'X-RapidAPI-Host': 'city-list.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      logger.i('code : ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List allData = data['0'];
      allCity = allData.map((e) => City.fromJson(e)).toList();
    }

    return allCity;
  }
}
