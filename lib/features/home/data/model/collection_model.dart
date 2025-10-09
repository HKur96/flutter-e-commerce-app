import 'package:ecommerce_app/features/home/domain/entity/collection.dart';

class CollectionModel extends Collection {
  const CollectionModel({
    required super.productId,
    required super.productName,
    required super.productPrice,
    required super.totalSold,
    required super.sellerName,
    required super.avgRating,
    required super.isOfficialStore,
    required super.productImages,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
        productId: json['id'],
        productName: json['name'],
        productPrice: json['price'],
        totalSold: json['total_sold'],
        sellerName: json['seller_name'],
        avgRating: json['avg_rating'],
        isOfficialStore: json['is_official_store'],
        productImages: (json['images'] == null) ? [] : json['images'].cast<String>(),
      );
}
