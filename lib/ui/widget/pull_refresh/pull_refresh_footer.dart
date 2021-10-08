import 'package:flutter/material.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullRefreshFooter extends CustomFooter {
  static final TextStyle _style =
      TextStyle(fontSize: 16, color: Color(0xff4d4d4d));

  PullRefreshFooter({
    Key key,
    onModeChange,
    onOffsetChange,
    readyLoading,
    endLoading,
    LoadStyle loadStyle: LoadStyle.ShowAlways,
    Function onClick,
  }) : super(
          key: key,
          onOffsetChange: onOffsetChange,
          onModeChange: onModeChange,
          onClick: onClick,
          loadStyle: loadStyle,
          height: 45,
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载更多",style: _style,);
            } else if (mode == LoadStatus.loading) {
              body = PullLoadingView('拼命加载中...');
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！",style: _style,);
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!",style: _style,);
            } else if (mode == LoadStatus.noMore) {
              body = Text("没有更多了!",style: _style,);
            }else{
              body = Container();
            }
            return Container(
              height: 45,
              child: Center(child: body),
            );
          },
        );
}
