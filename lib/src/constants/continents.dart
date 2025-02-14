import 'package:flutter_riverpod/flutter_riverpod.dart';

const Set<String> _continents = {
  'Antarctica',
  'North' 'America',
  'Europe',
  'Africa',
  'Asia',
  'Oceania',
  'South America'
};


final continentsOptionsProvider = Provider<Set<String>>((ref) {
  return _continents;
});
