import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:flutter_reading/ui/article_list_page.dart';
import 'package:flutter_reading/utils/sp_utils.dart';
import 'package:get/get.dart';

class SearchHeaderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchHeaderViewState();
  }
}

class _SearchHeaderViewState extends State<SearchHeaderView> {
  final TextEditingController _textEditingController = TextEditingController();
  List recentWordList;

  void initState() {
    super.initState();
    getSearchKeyList();
  }

  void getSearchKeyList() async {
    recentWordList = await SpUtils.getSearchList("recent");
  }

  @override
  Widget build(BuildContext context) {
    return buildSearchView(context);
  }

  Widget buildSearchView(context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cf0f3f5,
                  // 边色与边宽度
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                // width: Common.screenWidth(context) - transSize(40),
                height: 35.0,
                margin: EdgeInsets.only(left: transSize(10), right: transSize(10)),
                child: createTextField(),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  String searchWord = _textEditingController.text.trim();

                  List list = recentWordList;

                  if (!ObjectUtil.isEmptyString(searchWord)) {
                    if (list.length < 10) {
                      if (!list.contains(searchWord)) {
                        list.insert(list.length, searchWord);
                      }
                    } else {
                      list.removeAt(0);
                      list.insert(list.length, searchWord);
                    }
                  }
                  SpUtils.saveSearch(list, "recent");
                  Get.to(() => ArticleListPage(searchWord));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35.0,
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: Text(
                    "搜索",
                    style: TextStyles.listContent.copyWith(fontSize: 16,color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget createTextField() {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
//        suffixIcon: false ? null : GestureDetector(behavior: HitTestBehavior.translucent, onTap: () {}, child: Icon(Icons.clear)),
          hintText: "请输入关键字",
          isDense: true,
          counterText: '',
          hintStyle: TextStyle(height: 1, fontSize: 14, color: AppColors.cb2b2b2),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff9d9fa3),
            size: 22,
          ),
          contentPadding: EdgeInsets.only(top: 10.0)),
//      onChanged: onInputBoxContentChanged,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,

      style: TextStyle(height: 1, fontSize: 16, color: Color(0xff1a1a1a)),
    );
  }
}
