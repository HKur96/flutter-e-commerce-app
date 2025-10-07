import 'package:ecommerce_app/common/shared/base_usecase.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';

class GetAllCategories extends BaseUseCase<List<Category>, void> {
  final HomeRepository _homeRepository;

  GetAllCategories(this._homeRepository);

  @override
  Future<List<Category>> call(void params) {
    return _homeRepository.fetchCategories();
  }
}
