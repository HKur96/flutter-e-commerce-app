import 'package:ecommerce_app/features/home/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.totalSold,
    required super.merchantName,
    required super.isOfficialStore,
    required super.avgRating,
    required super.images,
    required super.totalRating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        totalSold: json['total_sold'],
        merchantName: json['seller_name'],
        isOfficialStore: json['is_official_store'],
        avgRating: json['avg_rating'],
        images: (json['images'] == null) ? [] : json['images'].cast<String>(),
        totalRating: json['total_rating'] ?? 0,
      );
}
