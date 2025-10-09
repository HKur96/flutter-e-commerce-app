import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/shared/provider/product_provider.dart';
import 'package:ecommerce_app/common/shared/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionTypeWidget extends StatefulWidget {
  final String title;
  final CollectionType collectionType;
  final bool isRefresh;

  const CollectionTypeWidget({
    super.key,
    required this.title,
    required this.collectionType,
    required this.isRefresh,
  });

  @override
  State<CollectionTypeWidget> createState() => _CollectionTypeWidgetState();
}

class _CollectionTypeWidgetState extends State<CollectionTypeWidget> {
  late final ProductProvider _productProvider = context.read<ProductProvider>();

  @override
  void initState() {
    super.initState();
    _onRefresh(false);
  }

  void _onRefresh([bool isRefresh = true]) {
    _productProvider.getListProduct(isRefresh, widget.collectionType);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: context.text.labelLarge,
              ),
              Text(
                'See All',
                style: context.text.bodySmall?.copyWith(
                  color: context.palette.blueOcean,
                ),
              )
            ],
          ),
        ),
        Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            final isLoading = productProvider.isLoadingProduct;
            final collections = productProvider.productsType(widget.collectionType);

            if (collections.isEmpty) {
              return const SizedBox.shrink();
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List<Widget>.generate(
                  collections.length,
                  (index) => ProductWidget(
                    product: collections[index],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
