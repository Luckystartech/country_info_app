import 'package:country_info_app/src/features/data/country_repository.dart';
import 'package:country_info_app/src/features/domain/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///generate all alphabets in capital letters
List<String> alphabets =
    List.generate(26, (index) => String.fromCharCode(65 + index));

class CountryController
    extends StateNotifier<AsyncValue<Map<String, List<Country>>>> {
  CountryController(this._repository) : super(const AsyncValue.data({})) {
    fetchAllCountriesByAphabets();
  }

  final CountryRepository _repository;

  ///fetch all countries
  Future<List<Country>> _fetchAllCountries() async {
    return await _repository.fetchAllCountries();
  }

  /// fetch countries and filter by name matches
  Future<void> fetchAllCountriesByAphabets() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final countries = await _fetchAllCountries();
      return _groupCountriesByAlphabet(countries);
    });
  }

  ///fetch countries and filter by name matches
  Future<void> filterCountriesByName(String name) async {
    //set state to loading
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      //fetch all countries without filters
      final countries = await _fetchAllCountries();

      //filter the countries based on name query from search field
      final filteredCountries =
          countries.where((country) => country.name.startsWith(name)).toList();
      //group all countries in aphabetical order
      return _groupCountriesByAlphabet(filteredCountries);
    });
  }

  ///fetch countries and filter by languages
  Future<void> filterCountriesByLanguages(String langauges) async {
    //set state to loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      //fetch all countries without filters
      final countries = await _fetchAllCountries();

      //filter the countries based on name query from languages
      final filteredCountries = countries.where((country) {
        return country.languages.any((langauge) => langauge.name == langauges);
      }).toList();
      //group all countries in aphabetical order
      return _groupCountriesByAlphabet(filteredCountries);
    });
  }

  ///fetch countries and filter by continent
  Future<void> filterCountriesByContinent(String continent) async {
    state = await AsyncValue.guard(() async {
      //get current states based on other filter
      List<Country> currentCountriesState = _getCurrentState();

      //fetch all countries without filters
      final allCountries = await _fetchAllCountries();

      //filter the countries based on continent
      final filteredCountries = allCountries
          .where((country) => country.continent == continent)
          .toList();

      // add the current states based on other filters to the new filter
      currentCountriesState = [...filteredCountries];

      //group all countries in aphabetical order
      return _groupCountriesByAlphabet(currentCountriesState);
    });
  }

  ///fetch countries and filter by timezones
  Future<void> filterCountriesByTimeZones(String timeZone) async {
    state = await AsyncValue.guard(() async {
      //get current states based on other filter
      List<Country> currentCountriesState = _getCurrentState();

      //fetch all countries without filters
      final allCountries = await _fetchAllCountries();

      //filter the countries based on timezones
      final filteredCountries = allCountries
          .where((country) => country.timezone == timeZone)
          .toList();

      // add the current states based on other filters to the new filter
      currentCountriesState = [...filteredCountries];

      return _groupCountriesByAlphabet(currentCountriesState);
    });
  }

  /// group all countries in aphabetical order
  Map<String, List<Country>> _groupCountriesByAlphabet(
      List<Country> countries) {
    Map<String, List<Country>> groupedCountries = {};

    for (String alphabet in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')) {
      groupedCountries[alphabet] = countries
          .where((country) => country.name.toUpperCase().startsWith(alphabet))
          .toList();
    }

    return groupedCountries;
  }

  ///get the current state based on other filters
  List<Country> _getCurrentState() {
    if (state is! AsyncData) return [];
    final currentData = state.asData?.value ?? {};
    final countries = currentData.values.expand((list) => list).toList();

    return countries;
  }
}

final countryControllerProvider = StateNotifierProvider<CountryController,
    AsyncValue<Map<String, List<Country>>>>((ref) {
  final repository = ref.watch(countryRepositoryProvider);
  return CountryController(repository);
});
