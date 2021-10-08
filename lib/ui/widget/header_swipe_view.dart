import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/banner_entity.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/ui/widget/home_custom_pagination.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import '../web_page.dart';

class HeaderSwipeView extends StatefulWidget {
  // final double statusBarHeight; //44
  final List<BannerData> bannerList;
  // final GlobalKey<HeaderBgViewState> headerState;

  HeaderSwipeView(
    this.bannerList, {
    Key key,
  }) : super(key: key);

  @override
  State createState() => _HeaderSwipeViewState();
}

class _HeaderSwipeViewState extends State<HeaderSwipeView> {
  //轮播图数据
//  GlobalKey<MainBindRoomViewState> _bindKey = GlobalKey();
  int currentPosition = 0; //轮播图

  bool needToClearMsgTips = false;
  List<BannerData> bannerList;
  SwiperController _swipeController = SwiperController();

  @override
  void initState() {
    super.initState();
    // for(int i=0;i<3;i++){
    //   CarouselItem item = CarouselItem();
    //   item.imageUrl = Constant.testUrl;
    //   carouselList.add(item);
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _swipeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool hadCarousel = ObjectUtil.isNotEmpty(widget.carouselList);
    ///375为[MainHeaderBlurView]高度-100为头像部分高度
    // double placeCarouselHeight = transSize(375) - widget.statusBarHeight - transSize(100);
    return Container(
      padding: EdgeInsets.only(bottom: transSize(20), top: transSize(20)),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: true,
            replacement: Container(),
            child: buildSwipeView(),
          ),
        ],
      ),
    );
  }

  Widget buildSwipeView() {
    return AspectRatio(
        aspectRatio: 9.0 / 4.0,
        child: Swiper(
          key: UniqueKey(),
          index: currentPosition,
          controller: _swipeController,
          itemBuilder: _swiperBuilder,
          itemCount: widget.bannerList?.length,
          pagination: new SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: new EdgeInsets.only(bottom: transSize(10)),
              builder: new SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
                return BannerPagination(config);
              })),
          control: null,
          duration: 1000,
          autoplayDelay: 3000,
          // onIndexChanged: _updateMainBlurBgView,
          autoplayDisableOnInteraction: true,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: _clickCarouselItem,
        ));
  }

  ///录播图点击事件
  void _clickCarouselItem(int index) {
    BannerData item = widget.bannerList[index];
    if (!ObjectUtil.isEmptyString(item.url)) {
      Get.to(() => WebPage(
            item.url,titleStr: "正在打开链接...",
          ));
    }
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    String url = widget.bannerList[index].image;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: transSize(15)),
      child: ClipRRect(
        borderRadius: new BorderRadius.all(new Radius.circular(transSize(32))),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ///更新首页毛玻璃
// void _updateMainBlurBgView(int index) {
//   currentPosition = index;
//   String url = widget.carouselList[index].imageUrl;
//   widget.headerState.currentState.updateImgUrl(url);
// }
}
