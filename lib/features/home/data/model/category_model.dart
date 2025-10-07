import 'package:ecommerce_app/features/home/domain/entity/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.iconUrl,
    required super.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        iconUrl: json['icon_url'],
        slug: json['slug'],
      );
}
