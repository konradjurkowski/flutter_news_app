import 'package:flutter/material.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageRes;
  final VoidCallback onItemClicked;

  CategoryItem(
      {required this.title,
      required this.imageRes,
      required this.onItemClicked,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.regularPadding),
      child: GestureDetector(
        child: GridTile(
          child: Image.asset(imageRes, fit: BoxFit.cover),
          footer: GridTileBar(
            title: Text(title,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white60,
          ),
        ),
        onTap: onItemClicked,
      ),
    );
  }
}
