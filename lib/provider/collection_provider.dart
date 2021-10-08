import 'package:flutter/cupertino.dart';
import 'package:flutter_reading/common/data_manager.dart';
import 'package:flutter_reading/dao/article_dao.dart';

class CollectionProvider extends ChangeNotifier {
  List<ArticleDao> list;

  void getArticleListByDb() async {
    ArticleDao dao = ArticleDao();
    list = await DBManager.getInstance().queryItems<ArticleDao>(dao);
    notifyListeners();
  }
}
