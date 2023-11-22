import 'dart:convert';

import 'package:bloc_country_api/models/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  String url = 'https://countriesnow.space/api/v0.1/countries/flag/images';

  Future<List<CountryModel>> getCountries() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonCountries = jsonResponse['data'];

      print(jsonResponse);
      return jsonCountries.map((e) => CountryModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed');
    }
  }
}
