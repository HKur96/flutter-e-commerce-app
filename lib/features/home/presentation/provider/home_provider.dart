import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/shared/provider/disposable_provider.dart';
import 'package:ecommerce_app/common/utils/injector.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/entity/collection.dart';
import 'package:ecommerce_app/features/home/domain/use-case/home_usecase.dart';

class HomeProvider extends DisposableProvider {
  bool _isLoadingCategory = false;
  bool _isLoadingCollectionFeatured = false;

  final Map<int, List<Category>> _dataCategories = {};
  final Map<int, List<Collection>> _dataCollections = {};

  List<Category> allCategories(User? user) {
    return _dataCategories[user?.id] ?? [];
  }

  List<Collection> listCollections(User? user) {
    return _dataCollections[user?.id] ?? [];
  }

  bool get isLoadingCategory => _isLoadingCategory;
  bool get isLoadingCollectionFeatured => _isLoadingCollectionFeatured;

  Future<List<Collection>> getAllColFeatured(bool isRefresh, {required User? user}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      _isLoadingCollectionFeatured = true;
      notifyListeners();

      final key = user?.id ?? 0;
      
      if (!isRefresh && _dataCollections.containsKey(key)) {
        _isLoadingCollectionFeatured = false;
        notifyListeners();
        return _dataCollections[key]!;
      }

      _dataCollections[key] = await locator<GetAllCollections>().call(CollectionType.featured);

      _isLoadingCollectionFeatured = false;
      notifyListeners();

      return _dataCollections[key]!;
    } catch (e) {
      _isLoadingCollectionFeatured = false;
      notifyListeners();
      return [];
    }
  }

  Future<List<Category>> getAllCategories(bool isRefresh, {required User? user}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      _isLoadingCategory = true;
      notifyListeners();

      final key = user?.id ?? 0;

      if (!isRefresh && _dataCategories.containsKey(key)) {
        _isLoadingCategory = false;
        notifyListeners();
        return _dataCategories[user?.id] ?? [];
      }

      // ignore: void_checks
      _dataCategories[key] = await locator<GetAllCategories>().call({});

      _isLoadingCategory = false;
      notifyListeners();

      return _dataCategories[key]!;
    } catch (e) {
      _isLoadingCategory = false;
      notifyListeners();

      return [];
    }
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
