import 'package:ecommerce_app/common/config/constant.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/helper/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    final currentUser = await SecureStorage().getUser();
    if (currentUser == null) {
      Navigator.of(context).pushReplacementNamed(Constant.kRouteLogin);
    } else {
      Navigator.of(context).pushReplacementNamed(Constant.kHomeScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.offBlue,
      body: Center(
        child: SvgPicture.asset(
          'assets/images/tumbas.svg',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
