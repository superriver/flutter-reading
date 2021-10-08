import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_reading/common/data_manager.dart';
import 'package:flutter_reading/dao/article_dao.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/provider/article_provider.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/ui/widget/base_view.dart';

class ArticleDetailPage extends StatelessWidget {
  final String id;

  ArticleDetailPage(
    this.id,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView(
          model: ArticleDetailProvider(),
          onModelReady: (ArticleDetailProvider model) {
            model.getArticleDetail(id);
            model.queryDataByDB(id);
          },
          builder: (context, ArticleDetailProvider model, child) {
            if (ObjectUtil.isEmpty(model.articleDetailData)) {
              return Container();
            }
            Widget child;

            if (!ObjectUtil.isEmptyString(model.articleDetailData.content)) {
              String content = model.articleDetailData.content;
              child = Html(
                data: content ?? '',
                shrinkWrap: true,
              );
            }
            if (!ObjectUtil.isEmptyString(model.articleDetailData.markdown)) {
              String content = model.articleDetailData.markdown;
              child = Markdown(
                data: content ?? '',
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              );
            }
            return Scaffold(
              body: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      leading: Icon(Icons.arrow_back),
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text("${model.articleDetailData.title ?? ''}"),
                        background: CachedNetworkImage(
                          imageUrl: model.articleDetailData.images[0],
                          fit: BoxFit.cover,
                          height: 80,
                          width: 120,
                          errorWidget: (context, url, error) => Container(
                            height: 80,
                            width: 120,
                            color: AppColors.cb2b2b2,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(child: child ?? Text("暂无内容")),
                    )
                  ],
                ),
              ),
              floatingActionButton: StatefulBuilder(builder: (context, setState) {
                return FloatingActionButton(
                  onPressed: () {
                    ArticleDetailData data = model.articleDetailData;
                    ArticleDao articleDao = ArticleDao()
                      ..id = id
                      ..author = data.author
                      ..desc = data.desc
                      ..createdAt = data.createdAt
                      ..title = data.title
                      ..imageUrl = data.images.first;
                    if (model.isCollected) {
                      DBManager.getInstance().deleteData<ArticleDao>(articleDao, key: "id", value: id);
                    } else {
                      DBManager.getInstance().insertData<ArticleDao>(articleDao);
                    }
                    model.isCollected = !model.isCollected;
                    setState(() {});
                  },
                  child: Text("收藏"),
                  backgroundColor: model.isCollected ? Colors.red : Colors.blue,
                );
              }),
            );
          }),
    );
  }
}
