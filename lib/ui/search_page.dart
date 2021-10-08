import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/res/gaps.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:flutter_reading/ui/article_list_page.dart';
import 'package:flutter_reading/ui/widget/search_header_view.dart';
import 'package:flutter_reading/utils/sp_utils.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  List recentWordList;

  String searchWord;

  @override
  void initState() {
    super.initState();

    getSearchKeyList();
  }

  void getSearchKeyList() async {
    recentWordList = await SpUtils.getSearchList("recent");
    setState(() {});
  }

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SearchHeaderView(),
            Gaps.vGap10,
            buildRecentSearchWidget(),
          ],
        ));
  }

  Widget buildRecentSearchWidget() {
    if (ObjectUtil.isEmptyList(recentWordList)) {
      return Container();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "最近搜索",
                style: TextStyles.listTitle,
              ),
            )
          ],
        ),
        Wrap(
            children: List.generate(recentWordList?.length, (int index) {
          return GestureDetector(
            onTap: () {
              // handleJump(recentWordList[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildItem(recentWordList[index]),
            ),
          );
        }))
      ],
    );
  }

  Widget buildItem(name) {
    if (ObjectUtil.isEmptyString(name)) {
      return Container();
    }
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.gray_f0, borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
        child: Text(name ?? ''),
      ),
    );
  }


}
