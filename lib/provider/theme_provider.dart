import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color themeColor;
  static const Map<ThemeMode, String> themes = {ThemeMode.dark: 'Dark', ThemeMode.light: 'Light', ThemeMode.system: 'System'};

  void setTheme(Color color) {
    themeColor = color;

    notifyListeners();
  }

  // ThemeMode getThemeMode() {
  //   String theme = SpUtil.getString(Constant.theme);
  //   switch (theme) {
  //     default:
  //       return ThemeMode.system;
  //   }
  // }
  Brightness get themeMode {
    return isDark ? Brightness.dark : Brightness.light;
  }

  bool isDark=false;


// getTheme({bool isDarkMode: false}) {
//   return ThemeData(
//       fontFamily: 'PingFang',
//       errorColor: isDarkMode ? Colours.dark_red : Colours.red,
//       brightness: isDarkMode ? Brightness.dark : Brightness.light,
//       primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
//       accentColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
//       // Tab指示器颜色
//       indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
//       // 页面背景色
//       scaffoldBackgroundColor: isDarkMode ? Colours.dark_bg_color : Colours.material_bg,
//       // 主要用于Material背景色
//       canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,
//       // 文字选择色（输入框复制粘贴菜单）
//       textSelectionColor: Colours.app_main.withAlpha(70),
//       textSelectionHandleColor: Colours.app_main,
//       textTheme: TextTheme(
//         // TextField输入文字颜色
//         subhead: isDarkMode ? TextStyles.textDark : TextStyles.text,
//         // Text文字样式
//         body1: isDarkMode ? TextStyles.textDark : TextStyles.text,
//         subtitle: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
//       ),
//       appBarTheme: AppBarTheme(
//         elevation: 0.0,
//         color: isDarkMode ? Colours.dark_bg_color : AppColors.red_color,
//         brightness: isDarkMode ? Brightness.dark : Brightness.light,
//       ),
//       dividerTheme: DividerThemeData(
//           color: isDarkMode ? Colours.dark_line : Colours.line,
//           space: 0.6,
//           thickness: 0.6
//       ),
//       cupertinoOverrideTheme: CupertinoThemeData(
//         brightness: isDarkMode ? Brightness.dark : Brightness.light,
//       )
//   );
// }

}
