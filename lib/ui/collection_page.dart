import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/common/data_manager.dart';
import 'package:flutter_reading/dao/article_dao.dart';
import 'package:flutter_reading/provider/collection_provider.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/ui/widget/article_item_view.dart';
import 'package:flutter_reading/ui/widget/base_view.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.cf0f3f5,
      body: BaseView(
          model: CollectionProvider(),
          onModelReady: (CollectionProvider provider) {
            provider.getArticleListByDb();
          },
          builder: (context, CollectionProvider provider, child) {
            if (ObjectUtil.isEmptyList(provider.list)) {
              return Container();
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                ArticleDao data = provider.list[index];
                return Dismissible(
                  key: UniqueKey(),
                  child: ArticleItemView(data),
                  secondaryBackground: Container(
                    child: Text('左滑取消收藏', style: TextStyle(fontSize: 22, color: Colors.white)),
                    color: Colors.red,
                    padding: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                  ),
                  background: Container(
                    child: Text('右滑取消收藏', style: TextStyle(fontSize: 22, color: Colors.white)),
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 30),
                    alignment: Alignment.centerLeft,
                  ),
                  onDismissed: (direction) {
                    DBManager.getInstance().deleteData<ArticleDao>(ArticleDao(), key: "id", value: data.id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        '已取消收藏',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: AppColors.cb2b2b2,
                      duration: Duration(milliseconds: 1000),
                    ));
                  },
                );
              },
              itemCount: provider.list.length,
              padding: EdgeInsets.zero,
            );
          }),
    );
  }
}
