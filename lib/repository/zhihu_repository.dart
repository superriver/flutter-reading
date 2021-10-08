
import 'package:flutter_reading/api/zhihu_api.dart';
import 'package:flutter_reading/net/net_manager.dart';

class ZhiHuRepository{
  String HOST = "http://news-at.zhihu.com/api/4/";

  void getDailyList(){
    // NetManager.getInstance().post(HOST+ZhiHuApi.NETS_LATEST, (result) async {
    //
    // },parseResult: (Map<String, dynamic> json) => VideoListResult.fromJson(json));
  }

}