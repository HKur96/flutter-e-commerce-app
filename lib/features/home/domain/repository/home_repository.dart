import 'package:ecommerce_app/features/home/domain/entity/category.dart';

abstract class HomeRepository {
  Future<List<Category>> fetchCategories();
}
