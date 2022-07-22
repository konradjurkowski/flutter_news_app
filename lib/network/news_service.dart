import 'dart:convert';
import 'dart:io';

import 'package:flutter_news_app/model/article_response.dart';
import 'package:flutter_news_app/util/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsService {
  Future<List<Article>> getTopHeadlinesArticles({String? category = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final countryCode = prefs.getString(COUNTRY_CODE);
    final url =
        "${NEWS_API_BASE_URL}top-headlines?country=${countryCode ?? 'us'}${category == null ? '' : '&category=$category'}&pageSize=30$NEWS_API_KEY";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ArticleResponse.fromJson(json.decode(response.body)).articles;
      } else {
        throw const HttpException("Cannot get news.");
      }
    } catch (error) {
      print(error.toString());
      throw HttpException("Cannot get news due to: $error.");
    }
  }
}
