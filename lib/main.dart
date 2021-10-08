import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reading/common/data_manager.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/ui/change_skin_page.dart';
import 'package:flutter_reading/ui/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
  print("打开数据库");
  DBManager.getInstance().initDb("reading");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String colorKey;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await SpUtil.getInstance();
    colorKey = SpUtil.getString("key_theme_color", defValue: 'blue');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var provider = watch(themeProvider);
        Color _themeColor = provider.themeColor ?? themeColorMap[colorKey];
        return ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () => GetMaterialApp(
                  title: 'Flutter Reading',
                  theme: ThemeData(
                    primaryColor: _themeColor,
                    brightness: provider.themeMode,
                  ),
                  home: child,
                ));
      },
      child: MainPage(),
    );
  }
}
