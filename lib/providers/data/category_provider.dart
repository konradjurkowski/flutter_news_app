import 'package:flutter_news_app/model/category.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';

abstract class CategoryProvider {
  List<Category> getCategories();
}

class CategoryProviderImpl implements CategoryProvider {

  final List<Category> _categories = [
    Category(
        title: StringResource.businessTitle,
        imageRes: StringResource.businessImage,
        name: StringResource.businessName
    ),
    Category(
        title: StringResource.entertainmentTitle,
        imageRes: StringResource.entertainmentImage,
        name: StringResource.entertainmentName
    ),
    Category(
        title: StringResource.healthTitle,
        imageRes: StringResource.healthImage,
        name: StringResource.healthName
    ),
    Category(
        title: StringResource.scienceTitle,
        imageRes: StringResource.scienceImage,
        name: StringResource.scienceName
    ),
    Category(
        title: StringResource.sportTitle,
        imageRes: StringResource.sportImage,
        name: StringResource.sportName
    ),
    Category(
        title: StringResource.technologyTitle,
        imageRes: StringResource.technologyImage,
        name: StringResource.technologyName
    ),
  ];

  @override
  List<Category> getCategories() {
    return _categories;
  }
}