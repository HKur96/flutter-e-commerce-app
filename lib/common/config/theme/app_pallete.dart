// lib/common/theme/app_palette.dart
import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  // === Primary ===
  final Color blueOcean;
  final Color orangeFresh;
  final Color navyBlack;
  final Color pureWhite;
  final Color backgroundColor;

  // === Secondary ===
  final Color earthGreen;
  final Color redVelvet;
  final Color darkGrey;
  final Color halfGrey;
  final Color softGrey;

  // === Label ===
  final Color offBlue;
  final Color offGreen;
  final Color offRed;

  const AppPalette({
    required this.backgroundColor,
    required this.blueOcean,
    required this.orangeFresh,
    required this.navyBlack,
    required this.pureWhite,
    required this.earthGreen,
    required this.redVelvet,
    required this.darkGrey,
    required this.halfGrey,
    required this.softGrey,
    required this.offBlue,
    required this.offGreen,
    required this.offRed,
  });

  @override
  AppPalette copyWith({
    Color? blueOcean,
    Color? orangeFresh,
    Color? navyBlack,
    Color? pureWhite,
    Color? earthGreen,
    Color? redVelvet,
    Color? darkGrey,
    Color? halfGrey,
    Color? softGrey,
    Color? offBlue,
    Color? offGreen,
    Color? offRed,
    Color? backgroundColor,
  }) {
    return AppPalette(
      blueOcean: blueOcean ?? this.blueOcean,
      orangeFresh: orangeFresh ?? this.orangeFresh,
      navyBlack: navyBlack ?? this.navyBlack,
      pureWhite: pureWhite ?? this.pureWhite,
      earthGreen: earthGreen ?? this.earthGreen,
      redVelvet: redVelvet ?? this.redVelvet,
      darkGrey: darkGrey ?? this.darkGrey,
      halfGrey: halfGrey ?? this.halfGrey,
      softGrey: softGrey ?? this.softGrey,
      offBlue: offBlue ?? this.offBlue,
      offGreen: offGreen ?? this.offGreen,
      offRed: offRed ?? this.offRed,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<AppPalette> lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      blueOcean: Color.lerp(blueOcean, other.blueOcean, t)!,
      orangeFresh: Color.lerp(orangeFresh, other.orangeFresh, t)!,
      navyBlack: Color.lerp(navyBlack, other.navyBlack, t)!,
      pureWhite: Color.lerp(pureWhite, other.pureWhite, t)!,
      earthGreen: Color.lerp(earthGreen, other.earthGreen, t)!,
      redVelvet: Color.lerp(redVelvet, other.redVelvet, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      halfGrey: Color.lerp(halfGrey, other.halfGrey, t)!,
      softGrey: Color.lerp(softGrey, other.softGrey, t)!,
      offBlue: Color.lerp(offBlue, other.offBlue, t)!,
      offGreen: Color.lerp(offGreen, other.offGreen, t)!,
      offRed: Color.lerp(offRed, other.offRed, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
