import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/di/app_module.dart';
import 'package:flutter_news_app/model/article_response.dart';
import 'package:flutter_news_app/ui/widget/image_item.dart';
import 'package:flutter_news_app/util/colors.dart';
import 'package:flutter_news_app/util/date/date_formatter.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';
import 'package:flutter_news_app/util/web_view_launcher.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = "/detail";

  final dateFormatter = getIt<DateFormatter>();
  final webviewLauncher = getIt<WebViewLauncher>();

  @override
  Widget build(BuildContext context) {
    final jsonString = ModalRoute.of(context)?.settings.arguments as String;
    final article = Article.fromJson(json.decode(jsonString));
    final formattedDate =
        "${dateFormatter.formatDayMonthYear(article.publishedAt)} ${dateFormatter.formatHourMinute(article.publishedAt)}";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.regularPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back, size: 30)
                ),
                const SizedBox(height: Dimens.mediumPadding),
                Text(
                  article.title ?? StringResource.emptyTitle,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: Dimens.mediumPadding),
                Hero(
                    tag: article.title ?? '',
                    child: ImageItem(imageUrl: article.urlToImage)),
                const SizedBox(height: Dimens.mediumPadding),
                Text(
                  "${StringResource.author}: ${article.author ?? StringResource.unknownAuthor}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "${StringResource.publishedAt}: $formattedDate",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: Dimens.mediumPadding),
                Text(
                  article.description ?? StringResource.noContent,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: Dimens.mediumPadding),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      webviewLauncher.launchWebView(article.url, context);
                    },
                    style: ElevatedButton.styleFrom(primary: buttonColor),
                    child: const Text(
                      StringResource.wantToSeeMore,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
