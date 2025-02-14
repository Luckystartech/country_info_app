import 'package:flutter_riverpod/flutter_riverpod.dart';

Set<String> _timeZones = {
  'UTC-02:00',
  'UTC-04:00',
  'UTC+01:00',
  'UTC',
  'UTC+08:00',
  'UTC+12:00',
  'UTC-08:00',
  'UTC+07:00',
  'UTC-01:00',
  'UTC+03:00',
  'UTC+02:00',
  'UTC-10:00',
  'UTC+10:00',
  'UTC+00:00',
  'UTC+11:00',
  'UTC+05:00',
  'UTC+05:30',
  'UTC+06:00',
  'UTC-05:00',
  'UTC+04:30',
  'UTC+13:00',
  'UTC+04:00',
  'UTC+09:00',
  'UTC-03:00',
  'UTC+05:45',
  'UTC+11:30',
  'UTC-06:00',
  'UTC+06:30',
  'UTC-11:00',
  'UTC-12:00',
  'UTC+03:30',
};

final timeZonesProvider = Provider<Set<String>>((ref) {
  return _timeZones;
});
