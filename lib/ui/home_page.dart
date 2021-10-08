import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/model/banner_entity.dart';
import 'package:flutter_reading/model/girl_entity.dart';
import 'package:flutter_reading/provider/home_provider.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/ui/web_page.dart';
import 'package:flutter_reading/ui/widget/app_bar.dart';
import 'package:flutter_reading/ui/widget/article_item_view.dart';
import 'package:flutter_reading/ui/widget/girls_grid_view.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_refresher.dart';
import 'package:flutter_reading/ui/widget/search_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'article_detail_page.dart';
import 'widget/header_swipe_view.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeProvider());

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final RefreshController refreshController = RefreshController();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(builder: (context, watch, _) {
      List<BannerData> bannerList = watch(homeProvider).bannerList;
      List<GirlData> girlList = watch(homeProvider).girlList;
      List<ArticleData> articleList = watch(homeProvider).articleList;
      return Scaffold(
        appBar: AppBar(
          title: SearchView(titleHint: "搜索"),
        ),
        // appBar: KTXSearchNavBar(
        //   titleHint: "搜索",
        // ),
        body: CustomRefresher(
          controller: refreshController,
          onRefresh: () {
            context.read(homeProvider).onRefresh();
            refreshController.refreshCompleted();
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverStack(
                children: [
                  // SliverToBoxAdapter(
                  //   child:HeaderBgView(key: _headerViewKey, imgUrl: carouselList?.first?.imageUrl)
                  // ),
                  SliverToBoxAdapter(
                    child: Visibility(visible: !ObjectUtil.isEmptyList(bannerList), replacement: Container(), child: HeaderSwipeView(bannerList)),
                  ),
                  // KTXSearchNavBar(
                  //   key: _navBarkey,
                  //   barColor: barColor,
                  //   titleHint: "搜索店铺/商品",
                  // ),
                ],
                positionedAlignment: Alignment.bottomCenter,
              ),
              if (ObjectUtil.isEmptyList(articleList))
                SliverToBoxAdapter()
              else
                SliverPadding(
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      if (index == 0) {
                        return Text(
                          "本周最热文章",
                          style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                        );
                      }
                      ArticleData data = articleList[index - 1];

                      return ArticleItemView(data);
                    }, childCount: articleList.length + 1 ?? 0),
                  ),
                  padding: EdgeInsets.only(right: transSize(15), left: transSize(15), top: transSize(10)),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "本周最火的妹纸",
                    style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                sliver: SliverWaterfallFlow(
                  gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    collectGarbage: (List<int> garbages) {
                      print('collect garbage : $garbages');
                    },
                    viewportBuilder: (int firstIndex, int lastIndex) {
                      print('viewport : [$firstIndex,$lastIndex]');
                    },
                  ),
                  delegate: SliverChildBuilderDelegate((BuildContext c, int index) {
                    return GirlItemView(girlList[index]);
                  }, childCount: girlList?.length ?? 0),
                ),
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
