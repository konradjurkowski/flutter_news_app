import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/di/app_module.dart';
import 'package:flutter_news_app/model/country.dart';
import 'package:flutter_news_app/providers/data/country_provider.dart';
import 'package:flutter_news_app/util/constants.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';
import 'package:flutter_news_app/util/snackbar_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenProvider extends ChangeNotifier {

  final snackManager = getIt<SnackBarManager>();
  final countryProvider = getIt<CountryProvider>();

  String username = '';
  Country? country;

  Country getFirstCountry() {
    return countryProvider.getCountries().first;
  }

  Country getCountryByName(String name) {
    return countryProvider.getCountryByCountryName(name);
  }

  Country getCountryByCountryCode(String countryCode) {
    return countryProvider.getCountryByCountryCode(countryCode);
  }

  List<Country> getSupportedCountries() {
    return countryProvider.getCountries();
  }

  void saveData(String username, String countryCode, BuildContext context) async {
    if (username.isNotEmpty && countryCode.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(USERNAME, username);
      await prefs.setString(COUNTRY_CODE, countryCode);
      this.username = username;
      this.country = getCountryByCountryCode(countryCode);
      notifyListeners();
    } else {
      snackManager.showMessage(
          context: context,
          title: StringResource.snackbarTitle,
          message: StringResource.fieldsCannotBeEmpty,
          contentType: ContentType.failure
      );
    }
  }

  void initUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final nick = prefs.getString(USERNAME);
    final countryCode = prefs.getString(COUNTRY_CODE);
    if (nick != null && countryCode != null) {
      username = nick;
      country = getCountryByCountryCode(countryCode);
      notifyListeners();
    }
  }
}