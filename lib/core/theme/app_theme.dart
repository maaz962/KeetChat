import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(
    const ColorScheme.light(
      primary: AppColors.teal,
      onPrimary: Colors.white,
      secondary: AppColors.orange,
      onSecondary: AppColors.lightText,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
      error: AppColors.coral,
    ),
    AppColors.lightBg,
  );

  static ThemeData get dark => _build(
    const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkBg,
      secondary: AppColors.orange,
      onSecondary: AppColors.darkBg,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
      error: AppColors.coral,
    ),
    AppColors.darkBg,
  );

  static ThemeData _build(ColorScheme scheme, Color bg) {
    final base = ThemeData(useMaterial3: true,
    colorScheme: scheme);
    return base.copyWith(
      scaffoldBackgroundColor: bg,
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.secondary,
        foregroundColor: scheme.onSecondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        )
      )
    );
  }
}