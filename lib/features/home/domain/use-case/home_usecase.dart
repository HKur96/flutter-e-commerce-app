import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/shared/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/entity/collection.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';

class GetAllCategories extends BaseUseCase<List<Category>, void> {
  final HomeRepository _homeRepository;

  GetAllCategories(this._homeRepository);

  @override
  Future<List<Category>> call(void params) {
    return _homeRepository.fetchCategories();
  }
}

class GetAllCollections extends BaseUseCase<List<Collection>, CollectionType> {
  final HomeRepository _homeRepository;
  GetAllCollections(this._homeRepository);

  @override
  Future<List<Collection>> call(CollectionType params) {
    return _homeRepository.fetchCollections(params);
  }
}
