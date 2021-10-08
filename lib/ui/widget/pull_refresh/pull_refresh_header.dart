import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/dimens.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 文档：https://github.com/peng8350/flutter_pulltorefresh/blob/master/propertys.md
/// 自定义下拉刷新头部
class PullRefreshHeader extends CustomHeader {
  static final double customHeight = transSize(90);
  static final TextStyle style = TextStyle(fontSize: 16, color: Color(0xff4d4d4d));

  static final TextStyle styleWhite = TextStyle(fontSize: 16, color: Colors.white);

  PullRefreshHeader({
    Key key,
    readyToRefresh,
    endRefresh,
    onOffsetChange,
    onModeChange,
    onResetValue,
    isShowCompletedText,
    Duration completeDuration: const Duration(milliseconds: 600),
    RefreshStyle refreshStyle: RefreshStyle.Follow,
  }) : super(
            key: key,
            builder: (BuildContext context, RefreshStatus mode) {
              Widget body;
              if (mode == RefreshStatus.idle) {
                body = Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset('images/pull_up_arrow.png', width: 14, color: isShowCompletedText ? Color(0xff4d4d4d) : Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '下拉可以刷新',
                          style: isShowCompletedText ? style : styleWhite,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (mode == RefreshStatus.canRefresh) {
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/pull_up_arrow.png', width: 14, color: isShowCompletedText ? Color(0xff4d4d4d) : Colors.white),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '松开立即刷新',
                        style: isShowCompletedText ? style : styleWhite,
                      ),
                    ),
                  ],
                );
              } else if (mode == RefreshStatus.failed) {
                body = Text(
                  "您的手速太快啦，先歇会吧~",
                  style: isShowCompletedText ? style : styleWhite,
                );
              } else if (mode == RefreshStatus.refreshing) {
                body = PullLoadingView(
                  '拼命加载中...',
                  isShowCompletedText: isShowCompletedText,
                );
              } else if (mode == RefreshStatus.completed) {
                body = isShowCompletedText
                    ? Text(
                        "加载完成",
                        style: style,
                      )
                    : Container();
              } else {
                body = Text(
                  "下拉刷新",
                  style: isShowCompletedText ? style : styleWhite,
                );
              }
              return Container(
                height: customHeight,
//                color: isShowCompletedText?Colors.white:Color(0xff4d4d4d),
                child: Center(child: body),
              );
            },
            height: customHeight,
            readyToRefresh: readyToRefresh,
            endRefresh: endRefresh);
}
