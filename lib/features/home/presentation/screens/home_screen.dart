import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/cart_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/settings_widget.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/wishlist_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> get _listBottomNavigation => [
        {'icon': 'assets/icons/ic_btm_home.png', 'label': 'Home'},
        {'icon': 'assets/icons/ic_btm_wishlist.png', 'label': 'Wishlist'},
        {'icon': 'assets/icons/ic_btm_cart.png', 'label': 'Cart'},
        {'icon': 'assets/icons/ic_btm_settings.png', 'label': 'Settings'},
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: List<BottomNavigationBarItem>.generate(
              _listBottomNavigation.length,
              (index) => BottomNavigationBarItem(
                    icon: Image.asset(
                      _listBottomNavigation[index]['icon'],
                      height: 24,
                      color: (_selectedIndex == index)
                          ? context.palette.blueOcean
                          : Colors.black,
                    ),
                    label: _listBottomNavigation[index]['label'],
                  )),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: context.palette.blueOcean,
          unselectedItemColor: context.disableColor,
          currentIndex: _selectedIndex,
          mouseCursor: SystemMouseCursors.click,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 1:
        return WishlistWidget();
      case 2:
        return CartWidget();
      case 3:
        return SettingsWidget();
      default:
        return HomeWidget();
    }
  }
}
