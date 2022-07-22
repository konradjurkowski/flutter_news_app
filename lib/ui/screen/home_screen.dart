import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/providers/home_screen_provider.dart';
import 'package:flutter_news_app/ui/screen/detail_screen.dart';
import 'package:flutter_news_app/ui/screen/setting_screen.dart';
import 'package:flutter_news_app/ui/widget/ArticleItem.dart';
import 'package:flutter_news_app/ui/widget/BasicProgressBar.dart';
import 'package:flutter_news_app/ui/widget/category_item.dart';
import 'package:flutter_news_app/ui/widget/top_bar.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeScreenProvider>(context, listen: false)
        .getArticles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.regularPadding),
          child: Column(
            children: [
              TopBar(onSearchClicked: () {
                HapticFeedback.vibrate();
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              }),
              const SizedBox(height: Dimens.mediumPadding),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount:
                      Provider.of<HomeScreenProvider>(context, listen: false)
                          .getCategories()
                          .length,
                  itemBuilder: (ctx, index) {
                    final category =
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .getCategories()[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.smallPadding),
                      width: 200,
                      child: CategoryItem(
                          title: category.title,
                          imageRes: category.imageRes,
                          onItemClicked: () {
                            HapticFeedback.vibrate();
                            Provider.of<HomeScreenProvider>(context,
                                    listen: false)
                                .getArticlesByCategory(category.name, context);
                          }),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: Dimens.regularPadding),
              Expanded(
                child: provider.loading
                    ? const BasicProgressBar()
                    : ListView.builder(
                        itemCount: provider.articles.length,
                        itemBuilder: (ctx, index) {
                          final article = provider.articles[index];
                          return ArticleItem(
                            title: article.title ?? "",
                            author: article.author ?? "",
                            source: article.source.name ?? "",
                            urlToImage: article.urlToImage,
                            publishedAt: article.publishedAt,
                            onItemClicked: () {
                              final json = jsonEncode(article.toJson());
                              HapticFeedback.vibrate();
                              Navigator.of(context).pushNamed(
                                  DetailScreen.routeName,
                                  arguments: json);
                            },
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
