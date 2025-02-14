// import 'package:country_info_app/src/features/data/country_repository.dart';
// import 'package:country_info_app/src/features/domain/country.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// ///generate all alphabets in capital letters
// List<String> alphabets =
//     List.generate(26, (index) => String.fromCharCode(65 + index));

// class CountryController
//     extends StateNotifier<AsyncValue<Map<String, List<Country>>>> {
//   CountryController(this._repository) : super(const AsyncValue.data({})) {
//     fetchAllCountriesByAphabets();
//   }

//   final CountryRepository _repository;

//   ///fetch all countries
//   Future<List<Country>> _fetchAllCountries() async {
//     return await _repository.fetchAllCountries();
//   }

//   /// fetch countries and filter by name matches
//   Future<void> fetchAllCountriesByAphabets() async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final countries = await _fetchAllCountries();
//       return _groupCountriesByAlphabet(countries);
//     });
//   }

//   ///fetch countries and filter by name matches
//   Future<void> filterCountriesByName(String name) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final countries = await _fetchAllCountries();
//       final filteredCountries =
//           countries.where((country) => country.name.startsWith(name)).toList();
//       return _groupCountriesByAlphabet(filteredCountries);
//     });
//   }

//   ///fetch countries and filter by languages
//   Future<void> filterCountriesByLanguages(String langauges) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final countries = await _fetchAllCountries();
//       final filteredCountries = countries.where((country) {
//         return country.languages.any((langauge) => langauge.name == langauges);
//       }).toList();
//       return _groupCountriesByAlphabet(filteredCountries);
//     });
//   }

//   ///fetch countries and filter by continent
//   Future<void> filterCountriesByContinent(String continent) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final countries = await _fetchAllCountries();
//       final filteredCountries =
//           countries.where((country) => country.continent == continent).toList();
//       return _groupCountriesByAlphabet(filteredCountries);
//     });
//   }

//   ///fetch countries and filter by timezones
//   Future<void> filterCountriesByTimeZones(String timeZone) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final countries = await _fetchAllCountries();
//       final filteredCountries =
//           countries.where((country) => country.timezone == timeZone).toList();
//       return _groupCountriesByAlphabet(filteredCountries);
//     });
//   }

//   /// group all countries in aphabetical order
//   Map<String, List<Country>> _groupCountriesByAlphabet(
//       List<Country> countries) {
//     Map<String, List<Country>> groupedCountries = {};

//     for (String alphabet in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) {
//       groupedCountries[alphabet] = countries
//           .where((country) => country.name.toUpperCase().startsWith(alphabet))
//           .toList();
//     }

//     return groupedCountries;
//   }
// }

// final countryControllerProvider = StateNotifierProvider<CountryController,
//     AsyncValue<Map<String, List<Country>>>>((ref) {
//   final repository = ref.watch(countryRepositoryProvider);
//   return CountryController(repository);
// });
