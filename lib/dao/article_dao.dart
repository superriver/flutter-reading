import 'dart:collection';

import 'package:flutter_reading/common/data_manager.dart';

class ArticleDao extends DbBaseBean {
  String id;
  String author;
  String desc;
  String createdAt;
  String title;
  String imageUrl;

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    ArticleDao  dao = ArticleDao();
    dao.id = map['id'];
    dao.author = map['author'];
    dao.desc = map['desc'];
    dao.createdAt = map['createdAt'];
    dao.title = map['title'];
    dao.imageUrl = map['imageUrl'];
    return dao;
  }

  @override
  String getTableName() {
    return "article_table";
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = HashMap();
    map['id'] = id;
    map['author'] = author;
    map['desc'] = desc;
    map['title'] = title;
    map['imageUrl'] = imageUrl;
    map['createdAt'] = createdAt;
    return map;
  }
}
