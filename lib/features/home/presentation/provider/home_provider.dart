import 'package:ecommerce_app/common/shared/provider/disposable_provider.dart';
import 'package:ecommerce_app/common/utils/injector.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/domain/use-case/home_usecase.dart';

class HomeProvider extends DisposableProvider {
  bool _isLoadingCategory = false;

  final Map<int, List<Category>> _dataCategories = {};

  List<Category> allCategories(User? user) {
    return _dataCategories[user?.id] ?? [];
  }

  bool get isLoadingCategory => _isLoadingCategory;

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
