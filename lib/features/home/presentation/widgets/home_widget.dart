import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildAppBar(context),
        SliverPadding(
          padding: EdgeInsets.all(10.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(List.generate(
              20,
              (index) => ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text('Appbar with dynamic height'),
              ),
            )),
          ),
        ),
      ],
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
