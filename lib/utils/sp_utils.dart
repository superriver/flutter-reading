import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtils{
  static saveSearch(List list,String type) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String jsonStr = jsonEncode(list);
    _prefs.setString(type+'_search_key_word', jsonStr);
  }

  static Future<List> getSearchList(String type) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List map = jsonDecode(_prefs.getString(type+'_search_key_word') ?? '[]');
    return map;
  }
}