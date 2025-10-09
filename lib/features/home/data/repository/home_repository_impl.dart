import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/helper/api_helper.dart';
import 'package:ecommerce_app/features/home/data/model/category_model.dart';
import 'package:ecommerce_app/features/home/data/model/collection_model.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/entity/collection.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiHelper _apiHelper;

  const HomeRepositoryImpl(this._apiHelper);

  @override
  Future<List<Category>> fetchCategories() async {
    try {
      final res = await _apiHelper.dio.get('/product/category');

      return (res.data['data'] as List)
          .map<Category>((cat) => CategoryModel.fromJson(cat))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Collection>> fetchCollections(CollectionType collectionType) async {
    try {
      final res = await _apiHelper.dio.get(
        '/product/collection/${_formatCollectionType(collectionType)}',
      );

      return (res.data['data'] as List)
          .map<Collection>((col) => CollectionModel.fromJson(col))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  String _formatCollectionType(CollectionType collectionType) {
    switch (collectionType) {
      case CollectionType.featured:
        return 'featured';
      case CollectionType.bestSellers:
        return 'best_sellers';
      case CollectionType.newArrival:
        return 'new_arrival';
      case CollectionType.specialOffers:
        return 'special_offers';
      case CollectionType.topRated:
        return 'top_rated';
      default:
        return 'news';
    }
  }
}
