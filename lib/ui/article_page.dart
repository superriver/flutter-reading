import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/model/category_entity.dart';
import 'package:flutter_reading/provider/article_provider.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/ui/read_mode_page.dart';
import 'package:flutter_reading/ui/widget/article_item_view.dart';
import 'package:flutter_reading/ui/widget/base_view.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_refresher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'article_detail_page.dart';
import 'widget/my_underline_tab_indicator.dart';

final categoryProvider = ChangeNotifierProvider((_) => CategoryProvider());

// final articleProvider = Provider.family<ArticleProvider,String>((ref,categoryId)=>ArticleProvider(categoryId));
class ArticlePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ArticlePageState();
  }
}

class _ArticlePageState extends State<ArticlePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("_ArticlePageState BuildContext");
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: 44), child: TabView()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TabView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    List<CategoryData> categoryList = watch(categoryProvider).categoryList ?? [];
    print("TabView ConsumerWidget");
    return DefaultTabController(
      length: categoryList.length,
      child: Column(
        children: [
          Container(
            height: 44,
            child: TabBar(
              indicator: MyUnderlineTabIndicator(borderSide: BorderSide(width: 2.0, color: Colors.red)),
              isScrollable: true,
              tabs: categoryList.map((f) {
                return Center(
                  child: new Text(
                    f.title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                );
              }).toList(),
              onTap: (index) {},
            ),
          ),
          Expanded(
            child: TabBarView(
              children: categoryList.map((e) {
                return TabBodyWidget(e.type);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBodyWidget extends StatefulWidget {
  final String type;

  TabBodyWidget(this.type);

  @override
  State<StatefulWidget> createState() {
    return _TabBodyWidgetState();
  }
}

class _TabBodyWidgetState extends State<TabBodyWidget> with AutomaticKeepAliveClientMixin {
  final  ArticleProvider _provider = ArticleProvider();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseView(
        model: _provider,
        onModelReady: (ArticleProvider model) {
          model.onRefresh(widget.type);
        },
        builder: (context, ArticleProvider model, child) {
          if (ObjectUtil.isEmptyList(model.articleList)) {
            return Container();
          }
          return Container(
            margin: EdgeInsets.only(right: transSize(15), left: transSize(15)),
            child:  CustomRefresher(
              enablePullUp: true,
              onRefresh: (){
                model.onRefresh(widget.type);
                model.refreshController.refreshCompleted();
              },
              onLoading: (){
                model.onLoadMore(widget.type);
                model.refreshController.loadComplete();
              },
              controller: model.refreshController,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    ArticleData data = model.articleList[index];
                    return ArticleItemView(data);
                  },
                  itemCount: model.articleList.length),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
