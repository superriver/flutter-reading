import 'package:flutter/material.dart';

class PullLoadingView extends StatefulWidget {
  final String descStr;

  final bool isShowCompletedText;

  PullLoadingView(this.descStr, {this.isShowCompletedText=true});

  @override
  _PullLoadingViewState createState() => _PullLoadingViewState();
}

class _PullLoadingViewState extends State<PullLoadingView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            //设置动画的旋转中心
            alignment: Alignment.center,
            //动画控制器
            turns: _controller,
            //将要执行动画的子view
            child: Image.asset(
              'images/pull_loading.png',
              width: 16,
              color: widget.isShowCompletedText?Color(0xff4d4d4d):Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:10),
            child: Text(
              widget.descStr,
              style:
                 TextStyle(fontSize: 16, color: widget.isShowCompletedText?Color(0xff4d4d4d):Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
