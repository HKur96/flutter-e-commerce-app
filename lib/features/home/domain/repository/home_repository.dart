import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/entity/collection.dart';

abstract class HomeRepository {
  Future<List<Category>> fetchCategories();

  Future<List<Collection>> fetchCollections(CollectionType collectionType);
}
