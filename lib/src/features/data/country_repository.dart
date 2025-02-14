import 'package:country_list_app/src/features/application/country_api_service.dart';
import 'package:country_list_app/src/features/domain/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CountryRepositoryInterface {
  //fetch all countries
  Future<List<Country>> fetchAllCountries();
}

class CountryRepository implements CountryRepositoryInterface {
  CountryRepository(this._countryApiService);

  final CountryApiService _countryApiService;

  @override
  Future<List<Country>> fetchAllCountries() async {
    return await _countryApiService.getCountries();
  }
}

final countryRepositoryProvider = Provider<CountryRepository>((ref) {
  final countryApiService = ref.watch(countryApiServiceProvider);
  return CountryRepository(countryApiService);
});
