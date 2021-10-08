
import 'package:flutter/cupertino.dart';
import 'package:flutter_reading/api/api.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/model/banner_entity.dart';
import 'package:flutter_reading/model/category_entity.dart';
import 'package:flutter_reading/model/girl_entity.dart';
import 'package:flutter_reading/repository/reading_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends ChangeNotifier {
  List<BannerData> bannerList;
  List<GirlData>  girlList;
  List<ArticleData> articleList;
  List<CategoryData> categoryList;
  HomeProvider(){
    onRefresh();
    // getHotListThisWeek();
    // getHotListThisWeek();
  }

  void onRefresh(){
    getBannerList();
    getHotListThisWeek(hotType: ReadingApi.HotType_Likes,category: ReadingApi.Category_Girl);
  }
  void getBannerList(){
    ReadingRepository.getBannerList((result){
      bannerList =  result?.data;
      notifyListeners();
    });

  }

  void getHotListThisWeek({String hotType,String category}){
    ReadingRepository.getHotListThisWeek<GirlEntity>((result){
       print("GirlEntity:$result");
       girlList = result?.data;
       notifyListeners();
    },hotType: ReadingApi.HotType_Likes,category: ReadingApi.Category_Girl);

    ReadingRepository.getHotListThisWeek<ArticleEntity>((result){
      print("ArticleEntity:$result");
      articleList = result?.data;
      notifyListeners();
    },hotType: ReadingApi.HotType_Likes,category: ReadingApi.Category_Article);

    ReadingRepository.getHotListThisWeek((result){
      print("result:$result");
      // girlList = result?.data;
      // notifyListeners();
    },hotType: ReadingApi.HotType_Likes,category: ReadingApi.Category_GanHuo);
  }


  void getCategoryList({String hotType,String category}){
    ReadingRepository.getCategoryList<CategoryEntity>((result){
      print("categoryList:$result");
      categoryList = result?.data;
      notifyListeners();
    });
  }



}

class SearchProvider extends ChangeNotifier {
  List<ArticleData> articleList;

  void search({String search}){
    ReadingRepository.search<ArticleEntity>((result){
      articleList = result?.data;
      print("articleList:$result");
      notifyListeners();
    },search: search);
  }
}