import 'package:flutter/material.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';
import 'package:intl/intl.dart';

import '../../util/resource/string_resource.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onSearchClicked;

  const TopBar({required this.onSearchClicked, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringResource.appName,
                style: TextStyle(
                    fontSize: Dimens.largeFontSize, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: TextStyle(
                    fontSize: Dimens.smallFontSize,
                    color: Colors.grey[300]
                ),
              )
            ]),
        IconButton(
            onPressed: onSearchClicked,
            icon: const Icon(Icons.settings, size: 30)
        )
      ],
    );
  }
}
