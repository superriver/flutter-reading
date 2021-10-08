import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_refresh_footer.dart';
import 'package:flutter_reading/ui/widget/pull_refresh/pull_refresh_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresher extends StatefulWidget {
  final RefreshController controller;
  final Widget child;
  final bool enablePullUp;
  final bool enableTwoLevel;
  final bool enablePullDown;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final VoidCallback onTwoLevel;
  // final OnOffsetChange onOffsetChange;
  final DragStartBehavior dragStartBehavior;
  final bool reverse;
  final double cacheExtent;
  final ScrollPhysics physics;
  final int semanticChildCount;
  final Axis scrollDirection;
  final ScrollController scrollController;
  final bool primary;
  final isShowCompletedText;

  CustomRefresher(
      {Key key,
      @required this.controller,
      this.child,
      this.enablePullDown: true,
      this.enablePullUp: false,
      this.enableTwoLevel: false,
      this.onRefresh,
      this.onLoading,
      this.onTwoLevel,
      // this.onOffsetChange,
      this.dragStartBehavior,
      this.primary,
      this.cacheExtent,
      this.semanticChildCount,
      this.reverse,
      this.physics,
      this.scrollDirection,
      this.isShowCompletedText=true,
      this.scrollController})
      : super(key: key);

  @override
  _KtxRefresherState createState() => _KtxRefresherState();
}

class _KtxRefresherState extends State<CustomRefresher> {

//  @override
//  void initState() {
//    if (widget.controller.initialRefresh) {
//      WidgetsBinding.instance.addPostFrameCallback((_) {
//        if (mounted) {
//          widget.controller
//              .requestRefresh(duration: Duration(milliseconds: 250));
//          widget.controller.headerMode.value = RefreshStatus.refreshing;
//        }
//      });
//    }
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.controller,
      child: widget.child,
      enablePullUp: widget.enablePullUp,
      enablePullDown: widget.enablePullDown,
      enableTwoLevel: widget.enableTwoLevel,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      // onTwoLevel: widget.onTwoLevel,
      // onOffsetChange: widget.onOffsetChange,
      dragStartBehavior: widget.dragStartBehavior,
      primary: widget.primary,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      reverse: widget.reverse,
      physics: widget.physics,
      scrollDirection: widget.scrollDirection,
      scrollController: widget.scrollController,
      header: PullRefreshHeader(isShowCompletedText: widget.isShowCompletedText,),
      footer: PullRefreshFooter(),
    );
  }
}
