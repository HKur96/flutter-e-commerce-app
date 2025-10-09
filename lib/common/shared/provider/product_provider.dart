import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/shared/provider/disposable_provider.dart';
import 'package:ecommerce_app/common/utils/injector.dart';
import 'package:ecommerce_app/features/home/domain/entity/product.dart';
import 'package:ecommerce_app/features/home/domain/use-case/home_usecase.dart';

class ProductProvider extends DisposableProvider {
  bool _isLoadingProduct = false;

  final Map<CollectionType, List<Product>> _dataProduct = {};

  List<Product> productsType(CollectionType collectionType) {
    return _dataProduct[collectionType] ?? [];
  }

  bool get isLoadingProduct => _isLoadingProduct;

  Future<List<Product>> getListProduct(bool isRefresh, CollectionType collectionType) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      _isLoadingProduct = true;
      notifyListeners();

      if (!isRefresh && _dataProduct.containsKey(collectionType)) {
        _isLoadingProduct = false;
        notifyListeners();
        return productsType(collectionType);
      }

      _dataProduct[collectionType] = await locator<GetAllCollections>().call(collectionType);

      _isLoadingProduct = false;
      notifyListeners();
      return productsType(collectionType);
    } catch (e) {
      return [];
    }
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
