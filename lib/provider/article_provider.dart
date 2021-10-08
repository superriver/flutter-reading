import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reading/common/data_manager.dart';
import 'package:flutter_reading/dao/article_dao.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/model/category_entity.dart';
import 'package:flutter_reading/provider/base_provider.dart';
import 'package:flutter_reading/repository/reading_repository.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryData> categoryList;

  CategoryProvider() {
    getCategoryList();
  }

  void getCategoryList() {
    ReadingRepository.getCategoryList<CategoryEntity>((result) {
      categoryList = result?.data;
      notifyListeners();
    });
  }
}

class ArticleProvider extends BaseProvider {
  List<ArticleData> articleList;

  int pageNum = 1;
  int totalRecord = 0;

  void onRefresh(String type) {
    ReadingRepository.getArticleListByCategory<ArticleEntity>((result) {
      articleList = result?.data;
      notifyListeners();
    }, type: type, pageNum: 1);
  }

  void onLoadMore(String type) {
    pageNum++;
    ReadingRepository.getArticleListByCategory<ArticleEntity>((result) {
      totalRecord = result.total_counts;
      if (articleList.length >= totalRecord) {
        if (!ObjectUtil.isEmptyList(articleList)) {
          refreshController.loadNoData();
        }
      }
      if (result.data != null) {
        articleList.addAll(result?.data);
      }
      notifyListeners();
    }, type: type, pageNum: pageNum);
  }
}

class ArticleDetailProvider extends ChangeNotifier {
  ArticleDetailData articleDetailData;

  bool isCollected=false;

  void getArticleDetail(String id) {
    ReadingRepository.getArticleDetail<ArticleDetailModel>((result) {
      articleDetailData = result?.data;
      notifyListeners();
    }, id: id);
  }

  queryDataByDB(id) async {
    List<ArticleDao> list = await DBManager.getInstance().queryItems<ArticleDao>(ArticleDao(), key: "id", value: id);
    isCollected = !ObjectUtil.isEmptyList(list);
    notifyListeners();
  }
}
