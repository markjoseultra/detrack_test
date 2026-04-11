import 'package:flutter/material.dart';

class AppColors {
  // Blues
  static const blue900 = Color(0xFF042C53);
  static const blue800 = Color(0xFF0C447C);
  static const blue600 = Color(0xFF185FA5);
  static const blue50 = Color(0xFFE6F1FB);

  // Badge — Near (green)
  static const nearBg = Color(0xFFEAF3DE);
  static const nearText = Color(0xFF3B6D11);

  // Badge — Mid range (amber)
  static const midBg = Color(0xFFFAEEDA);
  static const midText = Color(0xFF854F0B);

  // Badge — Far (red)
  static const farBg = Color(0xFFFCEBEB);
  static const farText = Color(0xFFA32D2D);

  // Light mode surfaces
  static const backgroundPrimaryLight = Color(0xFFFFFFFF);
  static const backgroundSecondaryLight = Color(0xFFF5F4F0);
  static const textPrimaryLight = Color(0xFF1A1A18);
  static const textSecondaryLight = Color(0xFF6B6A66);
  static const borderTertiaryLight = Color(0x201A1A18);
  static const borderSecondaryLight = Color(0x381A1A18);

  // Dark mode surfaces
  static const backgroundPrimaryDark = Color(0xFF1E1E1C);
  static const backgroundSecondaryDark = Color(0xFF2A2A28);
  static const textPrimaryDark = Color(0xFFF0EFE9);
  static const textSecondaryDark = Color(0xFF9B9A96);
  static const borderTertiaryDark = Color(0x1AFFFFFF);
  static const borderSecondaryDark = Color(0x2EFFFFFF);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundSecondaryLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blue900,
        onPrimary: AppColors.blue50,
        secondary: AppColors.blue600,
        onSecondary: AppColors.blue50,
        surface: AppColors.backgroundPrimaryLight,
        onSurface: AppColors.textPrimaryLight,
        surfaceContainerHighest: AppColors.backgroundSecondaryLight,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),
        titleSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),
        bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textPrimaryLight),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondaryLight),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textSecondaryLight),
      ),
      cardTheme: CardThemeData(
        color: AppColors.backgroundPrimaryLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.borderTertiaryLight, width: 0.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue900,
          foregroundColor: AppColors.blue50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textSecondaryLight,
          side: BorderSide(color: AppColors.borderSecondaryLight, width: 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.borderTertiaryLight, thickness: 0.5, space: 0),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.backgroundSecondaryLight,
        labelStyle: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderSecondaryLight, width: 0.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundSecondaryDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.blue50,
        onPrimary: AppColors.blue900,
        secondary: AppColors.blue600,
        onSecondary: AppColors.blue50,
        surface: AppColors.backgroundPrimaryDark,
        onSurface: AppColors.textPrimaryDark,
        surfaceContainerHighest: AppColors.backgroundSecondaryDark,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
        titleSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),
        bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textPrimaryDark),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondaryDark),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textSecondaryDark),
      ),
      cardTheme: CardThemeData(
        color: AppColors.backgroundPrimaryDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.borderTertiaryDark, width: 0.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue50,
          foregroundColor: AppColors.blue900,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textSecondaryDark,
          side: BorderSide(color: AppColors.borderSecondaryDark, width: 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.borderTertiaryDark, thickness: 0.5, space: 0),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.backgroundSecondaryDark,
        labelStyle: const TextStyle(fontSize: 12, color: AppColors.textSecondaryDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderSecondaryDark, width: 0.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      ),
    );
  }
}
