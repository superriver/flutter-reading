import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerPagination extends StatelessWidget {
  final SwiperPluginConfig config;

  BannerPagination(this.config);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(12),
      width: ScreenUtil().setWidth(750),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getList(),
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> widgets = [];
    for (int i = 0; i < config.itemCount; i++) {
      widgets.add(getListChild(i));
    }
    return widgets;
  }

  Widget getListChild(int index) {
    if (index == config.activeIndex) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
        height: ScreenUtil().setWidth(8),
        width: ScreenUtil().setWidth(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(6)))),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
        height: ScreenUtil().setWidth(8),
        width: ScreenUtil().setWidth(8),
        decoration: BoxDecoration(
            color: Color(0x7dffffff),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(6)))),
      );
    }
  }
}



