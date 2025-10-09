import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final num price;
  final int totalSold;
  final String merchantName;
  final bool isOfficialStore;
  final num avgRating;
  final int totalRating;
  final List<String> images;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.totalSold,
    required this.merchantName,
    required this.isOfficialStore,
    required this.avgRating,
    required this.totalRating,
    required this.images,
  });

  String get displayPrice => 'Rp. ${price.toString()}';

  String get displayRating => avgRating.toStringAsFixed(1);

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        totalSold,
        merchantName,
        isOfficialStore,
        avgRating,
        totalRating,
        images,
      ];
}
