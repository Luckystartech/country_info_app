import 'dart:convert';
import 'package:country_info_app/src/features/domain/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const countryListApi = 'https://restcountries.com/v3.1/all';

class CountryApiService {
  Future<List<Country>> getCountries() async {
    try {
      final Uri uri = Uri.parse(countryListApi);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final countryData = jsonDecode(response.body) as List;

        final List<Country> countries = countryData
            .map((country) => Country.fromMap(country as Map<String, dynamic>))
            .toList();

        // print(countries.where((country)=> country.name.startsWith('Z')));
        return countries;
      } else {
        throw Exception('Cannot fetch Countries');
      }
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }
}

final countryApiServiceProvider =
    Provider<CountryApiService>((ref) => CountryApiService());

// void main() async {
//   Map<String, List<Country>> groupCountriesByAlphabet(List<Country> countries) {
//     Map<String, List<Country>> groupedCountries = {};

//     for (String alphabet in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) {
//       groupedCountries[alphabet] = countries
//           .where((country) => country.name.toUpperCase().startsWith(alphabet))
//           .toList();
//     }

//     return groupedCountries;
//   }

//   final service = CountryApiService();
//   final countries = await service.getCountries();

//   print(groupCountriesByAlphabet(countries)['A']);
// }
