import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user.dart';
import 'package:ecommerce_app/features/home/domain/entity/category.dart';
import 'package:ecommerce_app/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesHomeWidget extends StatefulWidget {
  final User? user;

  const CategoriesHomeWidget({super.key, required this.user});

  @override
  State<CategoriesHomeWidget> createState() => _CategoriesHomeWidgetState();
}

class _CategoriesHomeWidgetState extends State<CategoriesHomeWidget> {
  late final Future<List<Category>> _getAllCategories =
      context.read<HomeProvider>().getAllCategories(false, user: widget.user);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeProvider>(builder: (context, homeProvider, _) {
        return FutureBuilder<List<Category>>(
            future: _getAllCategories,
            builder: (context, snapshot) {
              List<Category> listCategories =
                  snapshot.data ?? homeProvider.allCategories(widget.user);

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Category', style: context.text.labelLarge),
                          Text(
                            'See All',
                            style: context.text.labelSmall?.copyWith(
                              color: context.palette.blueOcean,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List<Widget>.generate(
                          listCategories.length,
                          (index) => Padding(
                            padding:
                                (index == 0) ? EdgeInsets.only(left: 16) : const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: listCategories[index].iconUrl ?? '',
                                  width: 48,
                                  height: 48,
                                  placeholder: (_, __) => SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  listCategories[index].name,
                                  style: context.text.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}
