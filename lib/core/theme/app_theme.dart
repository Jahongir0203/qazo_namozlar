import 'package:flutter/material.dart';
import 'package:qazo_namozlar/core/theme/theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme:
          const AppBarTheme(backgroundColor: AppColors.backgroundColor));
}
