import 'package:equatable/equatable.dart';

class Collection extends Equatable {
  final int productId;
  final String productName;
  final num productPrice;
  final int totalSold;
  final String sellerName;
  final num avgRating;
  final bool isOfficialStore;
  final List<String> productImages;

  const Collection({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.totalSold,
    required this.sellerName,
    required this.avgRating,
    required this.isOfficialStore,
    required this.productImages,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        productPrice,
        totalSold,
        sellerName,
        avgRating,
        isOfficialStore,
        productImages,
      ];
}
