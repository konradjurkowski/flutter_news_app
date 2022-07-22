import 'package:flutter_news_app/model/country.dart';

abstract class CountryProvider {
   List<Country> getCountries();
   Country getCountryByCountryCode(String countryCode);
   Country getCountryByCountryName(String name);
}

class CountryProviderImpl implements CountryProvider {

  final List<Country> _countries = [
    Country(
        name: 'Austria',
        countryCode: 'at',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AT.svg'
    ),
    Country(
        name: 'Belgium',
        countryCode: 'be',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BE.svg'
    ),
    Country(
        name: 'Canada',
        countryCode: 'ca',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CA.svg'
    ),
    Country(
        name: 'Czech Republic',
        countryCode: 'cz',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CZ.svg'
    ),
    Country(
        name: 'France',
        countryCode: 'fr',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FR.svg'
    ),
    Country(
        name: 'Germany',
        countryCode: 'de',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DE.svg'
    ),
    Country(
        name: 'Lithuania',
        countryCode: 'lt',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LT.svg'
    ),
    Country(
        name: 'United Kingdom',
        countryCode: 'gb',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GB.svg'
    ),
    Country(
        name: 'Portugal',
        countryCode: 'pt',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PT.svg'
    ),
    Country(
        name: 'Poland',
        countryCode: 'pl',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PL.svg'
    ),
    Country(
        name: 'Italy',
        countryCode: 'it',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IT.svg'
    ),
    Country(
        name: 'United States',
        countryCode: 'us',
        imageUrl: 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/US.svg'
    ),
  ];

  @override
  List<Country> getCountries() {
    return _countries;
  }

  @override
  Country getCountryByCountryCode(String countryCode) {
    return _countries.firstWhere((country) => country.countryCode == countryCode);
  }

  @override
  Country getCountryByCountryName(String name) {
    return _countries.firstWhere((country) => country.name == name);
  }
}

