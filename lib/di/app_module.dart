import 'package:flutter_news_app/network/network_info.dart';
import 'package:flutter_news_app/network/news_service.dart';
import 'package:flutter_news_app/providers/data/category_provider.dart';
import 'package:flutter_news_app/providers/data/country_provider.dart';
import 'package:flutter_news_app/util/date/date_formatter.dart';
import 'package:flutter_news_app/util/snackbar_manager.dart';
import 'package:flutter_news_app/util/web_view_launcher.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {

  getIt.registerLazySingleton(() => NewsService());
  getIt.registerFactory<NetworkInfo>(() => NetworkInfoImpl());
  getIt.registerFactory<SnackBarManager>(() => SnackBarManagerImpl());
  getIt.registerFactory<DateFormatter>(() => DateFormatterImpl());
  getIt.registerFactory(() => WebViewLauncher());
  getIt.registerFactory<CategoryProvider>(() => CategoryProviderImpl());
  getIt.registerFactory<CountryProvider>(() => CountryProviderImpl());
}