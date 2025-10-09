import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/features/home/domain/entity/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.palette.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: CachedNetworkImage(
                  imageUrl: product.images.firstOrNull ?? '',
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                product.name,
                style: context.text.labelMedium,
              ),
              const SizedBox(height: 4),
              Text(
                product.displayPrice,
                style: context.text.labelMedium?.copyWith(
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Text(
                        product.displayRating,
                        style: context.text.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        product.totalRating.toString(),
                        style: context.text.bodySmall,
                      ),
                      Text(
                        ' Reviews',
                        style: context.text.bodySmall,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.eighteen_mp,
                    size: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
