import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import 'constants.dart';
import 'di.dart';

class InitialAppData {
  static Future<void> load() async {
    final hive = di<HiveInterface>();
    final themeBox = await hive.openLazyBox(Constants.themeBoxName);
    final mode = await themeBox.get(Constants.themeModeRef);
    di.registerSingleton<ThemeMode>(_selectTheme(mode));
  }

  static ThemeMode _selectTheme(dynamic mode) {
    switch (mode) {
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
