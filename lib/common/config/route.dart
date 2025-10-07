import 'package:ecommerce_app/common/config/constant.dart';
import 'package:ecommerce_app/common/config/global.dart';
import 'package:ecommerce_app/features/auth/presentation/screen/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screen/register_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    gRoute = settings.name ?? '';
    late Widget Function(BuildContext) destinationScreen;
    Map<String, dynamic>? arguments;

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    if (kDebugMode) print('current route ${settings.name}');

    print('ppp ${settings.name}');
    switch (settings.name) {
      case Constant.kRouteRegister:
        destinationScreen = (_) => const RegisterScreen();
        break;
      case Constant.kRouteLogin:
        destinationScreen = (_) => const LoginScreen();
        break;
      case Constant.kRouteResetPassword:
        destinationScreen = (_) => const ResetPasswordScreen();
        break;
      case Constant.kMainScreen:
        destinationScreen = (_) => const MainScreen();
        break;

      default:

        /// TODO: write default route
        destinationScreen = (context) => const Scaffold(
              body: Center(
                child: Text('404 Not Found'),
              ),
            );
    }

    return MaterialPageRoute(builder: destinationScreen, settings: settings);
  }
}
