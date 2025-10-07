import 'package:ecommerce_app/common/helper/api_helper.dart';
import 'package:ecommerce_app/features/home/data/model/category_model.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
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
}
