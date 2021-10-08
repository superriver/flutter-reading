import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/provider/home_provider.dart';
import 'package:flutter_reading/ui/widget/article_item_view.dart';
import 'package:flutter_reading/ui/widget/base_view.dart';
import 'package:flutter_reading/ui/widget/search_header_view.dart';
import 'package:get/get.dart';

import 'article_detail_page.dart';

class ArticleListPage extends StatelessWidget {
  final String search;

  ArticleListPage(this.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchHeaderView(),
          BaseView(
              model: SearchProvider(),
              onModelReady: (SearchProvider model) {
                model.search(search: search);
              },
              builder: (context, SearchProvider model, child) {
                if (ObjectUtil.isEmptyList(model.articleList)) {
                  return Container();
                }
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      ArticleData data = model.articleList[index];
                      return ArticleItemView(data);
                    },
                    itemCount: model.articleList.length,
                    padding: EdgeInsets.zero,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
