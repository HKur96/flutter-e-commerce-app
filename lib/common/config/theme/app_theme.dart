import 'package:ecommerce_app/common/config/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3669C9),
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.dmSansTextTheme(),
    hintColor: const Color.fromRGBO(0, 0, 0, 0.541),
    disabledColor: Colors.black38,
    pageTransitionsTheme: pageTransitionsTheme,
    dividerColor: Colors.black26,
    inputDecorationTheme: inputDecorationTheme,
    dividerTheme: const DividerThemeData(thickness: 0.3),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        surfaceTintColor: const Color(0xffed323e),
      ),
    ),
    extensions: [
      const AppPalette(
        blueOcean: Color(0xFF3669C9),
        orangeFresh: Color(0xFFFDA429),
        navyBlack: Color(0xFF13181F),
        pureWhite: Color(0xFFFFFFFF),
        earthGreen: Color(0xFF3A9B7A),
        redVelvet: Color(0xFFC93545),
        darkGrey: Color(0xFF838589),
        halfGrey: Color(0xFF838589),
        softGrey: Color(0xFFEDEDED),
        offBlue: Color(0xFFEFF5FB),
        offGreen: Color(0xFFEEFAF6),
        offRed: Color(0xFFFCECEF),
      ),
    ],
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFFBFDFD),
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.black38),
    ),
    suffixIconColor: Colors.black87,
    suffixStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      fontSize: 14,
    ),
    prefixIconColor: Colors.black87,
    prefixStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      fontSize: 14,
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black38,
      fontSize: 14,
    ),
  );

  static const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    },
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      height: 1.123,
      letterSpacing: 0,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: 1.55,
      letterSpacing: 0,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 1.22,
      letterSpacing: 0,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1.25,
      letterSpacing: 0,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      height: 1.2857,
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 1.2727,
      letterSpacing: 0,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.42857,
      letterSpacing: 0.1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.42857,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.33,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.4545,
      letterSpacing: 0.5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: 0.15,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.42857,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0.4,
    ),
  );

  // static final ColorScheme lightColorScheme = ColorScheme(
  //   brightness: Brightness.light,
  //   surfaceTint: const Color(0xFFFBFDFD),
  //   primary: AppPalette,
  //   onPrimary: Colors.white,
  //   primaryContainer: Pallete.kPrimarySwatch[100]!,
  //   onPrimaryContainer: const Color(0xFF470f13),
  //   secondary: Pallete.kSecondarySwatch[500]!,
  //   onSecondary: Colors.black87,
  //   secondaryContainer: Pallete.kSecondarySwatch[200]!,
  //   onSecondaryContainer: const Color(0xFF332908),
  //   tertiary: Pallete.kTertiarySwatch[500]!,
  //   onTertiary: Colors.white,
  //   tertiaryContainer: Pallete.kTertiarySwatch[300]!,
  //   onTertiaryContainer: const Color(0xFF111a1b),
  //   error: Pallete.kErrorSwatch[500]!,
  //   errorContainer: Pallete.kErrorSwatch[200]!,
  //   onError: Colors.black54,
  //   onErrorContainer: const Color(0xFF302009),
  //   background: const Color(0xFFFBFDFD),
  //   onBackground: const Color(0xFF191C1D),
  //   surface: const Color(0xFFFBFDFD),
  //   onSurface: const Color(0xFF191C1D),
  //   surfaceVariant: const Color(0xFFe2e4e4),
  //   onSurfaceVariant: const Color(0xFF4b4c4c),
  //   outline: const Color(0xFF7e7f7f),
  //   onInverseSurface: const Color(0xFFe2e4e4),
  //   inverseSurface: const Color(0xFF323333),
  //   inversePrimary: Pallete.kPrimarySwatch[300]!,
  //   shadow: Colors.black87,
  // );

  // static final ColorScheme darkColorScheme = ColorScheme(
  //   brightness: Brightness.dark,
  //   surfaceTint: const Color(0xFF191C1D),
  //   primary: Pallete.kPrimarySwatch[300]!,
  //   onPrimary: const Color(0xFF470f13),
  //   primaryContainer: Pallete.kPrimarySwatch[900]!,
  //   onPrimaryContainer: Pallete.kPrimarySwatch[50]!,
  //   secondary: Pallete.kSecondarySwatch[500]!,
  //   onSecondary: const Color(0xFF4c3d0c),
  //   secondaryContainer: Pallete.kSecondarySwatch[200]!,
  //   onSecondaryContainer: const Color(0xFF332908),
  //   tertiary: Pallete.kTertiarySwatch[500]!,
  //   onTertiary: Colors.white,
  //   tertiaryContainer: Pallete.kTertiarySwatch[300]!,
  //   onTertiaryContainer: const Color(0xFF111a1b),
  //   error: Pallete.kErrorSwatch[500]!,
  //   errorContainer: Pallete.kErrorSwatch[200]!,
  //   onError: Colors.white,
  //   onErrorContainer: const Color(0xFF302009),
  //   background: const Color(0xFF191C1D),
  //   onBackground: const Color(0xFFE0E3E3),
  //   surface: const Color(0xFF191C1D),
  //   onSurface: const Color(0xFFE0E3E3),
  //   surfaceVariant: const Color(0xFF47494a),
  //   onSurfaceVariant: const Color(0xFFd1d2d2),
  //   outline: const Color(0xFF8c8e8e),
  //   onInverseSurface: const Color(0xFF191C1D),
  //   inverseSurface: const Color(0xFFFBFDFD),
  //   inversePrimary: Pallete.kPrimarySwatch[500]!,
  //   shadow: Colors.black87,
  // );
}
