class Country {
  final String name;
  final String capital;
  final Flag flag;
  final CoatOfArms? coatOfArms;
  final int population;
  final String region;
  final String continent;
  final List<Language> languages;
  final double area;
  final Currency currency;
  final String timezone;
  final DrivingSide dialingCode;
  final String drivingSide;

  Country({
    required this.name,
    required this.capital,
    required this.flag,
    this.coatOfArms,
    required this.population,
    required this.region,
    required this.continent,
    required this.languages,
    required this.area,
    required this.currency,
    required this.timezone,
    required this.dialingCode,
    required this.drivingSide,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name']['common'] ?? 'Unknown',
      capital: map['capital'] != null && (map['capital'] as List).isNotEmpty
          ? map['capital'][0]
          : 'Unknown',
      flag: Flag.fromMap(map['flags']),
      coatOfArms:  map['coatOfArms'] != null && (map['coatOfArms'] as Map).isNotEmpty ? CoatOfArms.fromMap(map['coatOfArms']): null,
      population: map['population'] ?? 0,
      region: map['region'] ?? 'Unknown',
      continent: map['continents'][0] ?? 'Unknown',
      languages: map['languages'] != null
          ? (map['languages'] as Map)
              .entries
              .map((e) => Language(e.key, e.value))
              .toList()
          : [],
      area: (map['area'] as num).toDouble(),
      currency: map['currencies'] != null
          ? Currency.fromMap(map['currencies'].entries.first)
          : Currency(name: 'UnKnown'),
      timezone: (map['timezones'] as List).isNotEmpty
          ? map['timezones'][0]
          : 'Unknown',
      dialingCode: (map['idd'] as Map).isNotEmpty
          ? DrivingSide.fromMap(map['idd'])
          : DrivingSide(root: 'UnKnown', suffix: 'Unknown'),
      drivingSide: map['car']['side'] ?? 'Unknown',
    );
  }

  @override
  String toString() {
    return '''Country(
    name: $name, 
    capital: $capital, 
    flag: $flag, 
    coatOfArms: $coatOfArms, 
    population: $population, 
    region: $region, 
    continent: $continent, 
    languages: $languages, 
    area: $area, 
    currency: $currency, 
    timezone: $timezone, 
    dialingCode: $dialingCode, 
    drivingSide: $drivingSide
    )''';
  }
}

class Flag {
  final String pngUrl;

  Flag({required this.pngUrl});

  factory Flag.fromMap(Map<String, dynamic> map) {
    return Flag(pngUrl: map['png'] ?? '');
  }

  @override
  String toString() => 'Flag(pngUrl: $pngUrl)';
}

class CoatOfArms {
  final String pngUrl;

  CoatOfArms({required this.pngUrl});

  factory CoatOfArms.fromMap(Map<String, dynamic> map) {
    return CoatOfArms(pngUrl: map['png'] ?? '');
  }

  @override
  String toString() => 'CoatOfArms(pngUrl: $pngUrl)';
}

class Language {
  final String code;
  final String name;

  Language(this.code, this.name);

  @override
  String toString() => 'Language(code: $code, name: $name)';
}

class Currency {
  final String name;

  Currency({required this.name});

  factory Currency.fromMap(MapEntry<String, dynamic> entry) {
    return Currency(name: entry.value['name'] ?? 'Unknown');
  }

  @override
  String toString() => 'Currency(name: $name)';
}

class DrivingSide {
  final String root;
  final String suffix;

  DrivingSide({required this.root, required this.suffix});

  factory DrivingSide.fromMap(Map<String, dynamic> map) {
    return DrivingSide(
      root: map['root'] ?? '',
      suffix: (map['suffixes'] as List).isNotEmpty ? map['suffixes'][0] : '',
    );
  }

  @override
  String toString() => "$root$suffix";
}















/*
class Country {
  final String commonName;
  final String officialName;
  final String region;
  final String flag;
  final String coatofArm;
  final String capital;
  final int population;
  final List languages;
  final int area;
  final List timeZones;
  final String currencies;
  final dailingCode;
  final drivingSide;

  Country({
    required this.commonName,
    required this.officialName,
    required this.region,
    required this.flag,
    required this.capital,
    required this.coatofArm,
    required this.population,
    required this.languages,
  });

  Map<String, dynamic> toMap() {
    return {
      'commonName': commonName,
      'officialName': officialName,
      'region': region,
      'flag': flag,
      'capital': capital,
      'coatOfArm': coatofArm,
      'population': population,
      'languages': languages,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      commonName: map['name']['common'] ?? '',
      officialName: map['name']['official'] ?? '',
      region: map['region'] ?? '',
      flag: map['flags']['png'] ?? '',
      capital: map['capital'][0] ?? '',
      coatofArm: map['coatOfArms']['png'] ?? '',
      population: map['population'] ?? 0,
      languages: List.from((map['languages'] as Map).values) ?? [],
    );
  }

  @override
  String toString() {
    return '''Country(
  commonName: $commonName, 
  officialName: $officialName,  
  region: $region, 
  flag: $flag, 
  capital: $capital, 
  coatOfArm: $coatofArm,
  population: $population, 
  languages: $languages
)''';
  }
}
*/