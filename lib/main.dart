import 'package:ecommerce_app/common/config/global.dart';
import 'package:ecommerce_app/common/config/route.dart';
import 'package:ecommerce_app/common/config/theme/app_theme.dart';
import 'package:ecommerce_app/common/shared/splash_screen.dart';
import 'package:ecommerce_app/common/utils/injector.dart';
import 'package:ecommerce_app/features/auth/presentation/provider/auth_provider.dart';
import 'package:ecommerce_app/features/counter/presentation/providers/counter_provider.dart';
import 'package:ecommerce_app/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:requests_inspector/requests_inspector.dart';

void main() async {
  gNavigatorKey = GlobalKey<NavigatorState>();

  await _initializeEnv();
  initLocator();

  runApp(
    RequestsInspector(
      enabled: kDebugMode,
      child: const MainApp(),
    ),
  );
}

Future<void> _initializeEnv() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    if (kDebugMode) {
      print('Cannot initialize env $e');
    }
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: MyRoute.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
