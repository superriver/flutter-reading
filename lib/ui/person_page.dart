import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/res/gaps.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:flutter_reading/ui/about_me_page.dart';
import 'package:flutter_reading/ui/change_skin_page.dart';
import 'package:flutter_reading/ui/collection_page.dart';
import 'package:get/get.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.cf0f3f5,
      body: Column(
        children: [
          Gaps.vGap20,
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201904%2F30%2F20190430080615_fPexz.thumb.700_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628331600&t=58b567e442569110468f7871289dd8e2",
              fit: BoxFit.cover,
              height: 80,
              width: 80,
              errorWidget: (context, url, error) => Container(
                height: 80,
                width: 120,
                color: AppColors.cb2b2b2,
              ),
            ),
          ),
          Gaps.vGap10,
          Text("程序猿"),
          Gaps.vGap15,
          GestureDetector(
            onTap: () {
              Get.to(() => CollectionPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("我的收藏", style: TextStyles.listTitle), Icon(Icons.arrow_forward_ios_outlined)],
              ),
            ),
          ),
          Gaps.vGap5,
          GestureDetector(
            onTap: () {
              Get.to(() => ChangeSkinPage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("换肤"), Icon(Icons.arrow_forward_ios_outlined)],
              ),
            ),
          ),
          Gaps.vGap5,
          GestureDetector(
            onTap: () {
              Get.to(() => AboutMePage());
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("关于我"), Icon(Icons.arrow_forward_ios_outlined)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
