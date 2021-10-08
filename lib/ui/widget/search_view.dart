import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../search_page.dart';

class SearchView extends StatelessWidget {
  final String titleHint;
  final String merchantId;
  final bool isSearchAll;
  final Color colors;
  SearchView({this.titleHint,this.merchantId,this.colors,this.isSearchAll});

  @override
  Widget build(BuildContext context) {
    return buildSearchWidget();
  }

  Widget buildSearchWidget() {
    return GestureDetector(
      onTap: () {
        Get.to(() => SearchPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: Color(0xffb2b2b2), width: ScreenUtil().setWidth(1)),
          // 边色与边宽度
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
        ),
        // width: Common.screenWidth(context) - transSize(40),
        height: 40,
        margin: EdgeInsets.only(left: transSize(10), right: transSize(10),bottom:  transSize(10)),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search,color:Color(0xff999999)),
                ),
                Text(
                  titleHint ?? '',
                  style: TextStyle(color: colors??Color(0xff999999), fontSize: ScreenUtil().setSp(16)),
                ),
//              Expanded(
//                child: Container(height: ScreenUtil().setHeight(60), alignment: Alignment.centerLeft, child: createTextField()),
//              ),
              ],
            )
          ],
        ),
      ),
    );
  }


}



