import 'package:flutter_reading/api/api.dart';
import 'package:flutter_reading/model/banner_entity.dart';
import 'package:flutter_reading/net/net_manager.dart';

class ReadingRepository {
  static getBannerList(Function onRequestSuccess) {
    NetManager.getInstance().get<BannerEntity>(ReadingApi.BANNER_LIST, onRequestSuccess);
  }

  static getHotListThisWeek<T>(Function onRequestSuccess, {String hotType, String category}) {
    NetManager.getInstance().get<T>(ReadingApi.getListByCategory(hotType: hotType, category: category), onRequestSuccess);
  }

  static getCategoryList<T>(Function onRequestSuccess) {
    NetManager.getInstance().get<T>(ReadingApi.CATEGORY_LIST, onRequestSuccess);
  }

  static getArticleListByCategory<T>(Function onRequestSuccess, {String category = 'GanHuo', String type, int pageNum}) {
    NetManager.getInstance().get<T>(ReadingApi.getArticleListByCategory(category: category, type: type, pageNum: pageNum, pageSize: 10), onRequestSuccess);
  }

  static getArticleDetail<T>(Function onRequestSuccess, {String id}) {
    NetManager.getInstance().get<T>(ReadingApi.getArticleDetail(id: id), onRequestSuccess);
  }

  static getImageList<T>(Function onRequestSuccess, {String category = 'GanHuo', String type, int pageNum}) {
    NetManager.getInstance().get<T>(ReadingApi.getImageList(category: category, type: type, pageNum: pageNum, pageSize: 10), onRequestSuccess);
  }

  static search<T>(Function onRequestSuccess, {String search,int pageNum=1}) {
    NetManager.getInstance().get<T>(ReadingApi.search(search: search, pageNum: pageNum, pageSize: 10), onRequestSuccess);
  }
}
