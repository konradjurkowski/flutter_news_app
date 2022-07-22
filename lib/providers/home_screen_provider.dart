import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/di/app_module.dart';
import 'package:flutter_news_app/model/category.dart';
import 'package:flutter_news_app/network/network_info.dart';
import 'package:flutter_news_app/network/news_service.dart';
import 'package:flutter_news_app/providers/data/category_provider.dart';
import 'package:flutter_news_app/util/snackbar_manager.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';

import '../model/article_response.dart';

class HomeScreenProvider with ChangeNotifier {
  final networkInfo = getIt<NetworkInfo>();
  final newsService = getIt<NewsService>();
  final snackManager = getIt<SnackBarManager>();
  final categoryProvider = getIt<CategoryProvider>();

  bool loading = false;
  List<Article> articles = [];

  List<Category> getCategories() {
    return categoryProvider.getCategories();
  }

  getArticlesByCategory(String category, BuildContext context) async {
    if (await networkInfo.isConnected) {
      loading = true;
      notifyListeners();
      try {
        articles = [...await newsService.getTopHeadlinesArticles(category: category)];
        notifyListeners();
      } catch (error) {
        snackManager.showMessage(
            context: context,
            title: StringResource.snackbarTitle,
            message: error.toString(),
            contentType: ContentType.failure
        );
      }
      loading = false;
      notifyListeners();
    } else {
      snackManager.showMessage(
          context: context,
          title: StringResource.snackbarTitle,
          message: StringResource.noInternetConnection,
          contentType: ContentType.warning
      );
    }
  }

  getArticles(BuildContext context) async {
    if (await networkInfo.isConnected) {
      loading = true;
      notifyListeners();
      try {
        articles = [...await newsService.getTopHeadlinesArticles()];
        notifyListeners();
      } catch (error) {
        snackManager.showMessage(
            context: context,
            title: StringResource.snackbarTitle,
            message: error.toString(),
            contentType: ContentType.failure
        );
      }
      loading = false;
      notifyListeners();
    } else {
      snackManager.showMessage(
          context: context,
          title: StringResource.snackbarTitle,
          message: StringResource.noInternetConnection,
          contentType: ContentType.warning
      );
    }
  }
}