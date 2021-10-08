import 'global.dart';

class Constant {
  static const String keyLanguage = 'key_language';

  static const int status_success = 0;

  static const String server_address = wan_android;

//  static const String wan_android = "http://172.16.120.22:8085";
  static const String wan_android = "http://192.168.124.24:8085";

  static const int type_sys_update = 1;
  static const int type_refresh_all = 5;

  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
}

class AppConfig {
  static const String appName = 'flutter_wanandroid';
  static const String version = '0.2.5';
  static const bool isDebug = Global.kReleaseMode;
}

class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}
