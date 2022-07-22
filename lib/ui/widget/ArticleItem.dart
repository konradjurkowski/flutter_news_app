import 'package:flutter/material.dart';
import 'package:flutter_news_app/di/app_module.dart';
import 'package:flutter_news_app/ui/widget/image_item.dart';
import 'package:flutter_news_app/util/colors.dart';
import 'package:flutter_news_app/util/date/date_formatter.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String author;
  final String source;
  final String? urlToImage;
  final String? publishedAt;
  final VoidCallback onItemClicked;

  const ArticleItem(
      {required this.title,
      required this.author,
      required this.source,
      required this.urlToImage,
      required this.publishedAt,
      required this.onItemClicked,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = getIt<DateFormatter>();
    final formattedDate =
        "${dateFormatter.formatDayMonthYear(publishedAt)} ${dateFormatter.formatHourMinute(publishedAt)}";

    return Card(
      color: secondaryColor,
      elevation: 5,
      child: InkWell(
        onTap: onItemClicked,
        child: Row(
          children: [
            Hero(
              tag: title,
              child: Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(Dimens.smallPadding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.smallPadding),
                  child: ImageItem(imageUrl: urlToImage),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "$formattedDate | $source",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
