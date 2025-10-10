import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/config/enum.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/categories_home_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/collection_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final User? _user = context.read<AuthProvider>().user;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildAppBar(context),
        CategoriesHomeWidget(user: _user),
        _buildProductCollections(
          collectionType: CollectionType.bestSellers,
          title: 'Best Seller',
        ),
        _buildDefaultImage(
            'https://hsubqrdbiopxlgaqmqmt.supabase.co/storage/v1/object/public/image/images/banner_default_1.png'),
        _buildProductCollections(
          collectionType: CollectionType.featured,
          title: 'Featured',
        ),
        _buildDefaultImage(
            'https://hsubqrdbiopxlgaqmqmt.supabase.co/storage/v1/object/public/image/images/banner_default_2.png'),
      ],
    );
  }

  SliverToBoxAdapter _buildDefaultImage(String imageUrl) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildProductCollections({
    required CollectionType collectionType,
    required String title,
  }) {
    return SliverToBoxAdapter(
      child: CollectionTypeWidget(
        title: title,
        collectionType: collectionType,
        isRefresh: false,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 115.0,
      floating: false,
      pinned: true,
      // backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1.1,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Search...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                ),
              )),
              Image.asset(
                'assets/icons/ic_search.png',
                height: 18,
              )
            ],
          ),
        ),
        background: Stack(
          children: [
            // Container(
            //   color: Colors.white,
            // ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 16, bottom: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: context.palette.halfGrey,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/tumbas.svg',
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/icons/ic_notif.png',
                          height: 18,
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/icons/ic_cart.png',
                          height: 18,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
