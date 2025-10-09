import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/entity/product.dart';

abstract class HomeRepository {
  Future<List<Category>> fetchCategories();

  Future<List<Product>> fetchCollections(CollectionType collectionType);
}
