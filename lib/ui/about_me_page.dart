import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/res/gaps.dart';
import 'package:flutter_reading/res/styles.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.cf0f3f5,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("我是一个无名的程序猿，工作5年了，喜欢钻研技术，快乐码代码，一起学习，一起成长。", style: TextStyles.listTitle.copyWith(fontSize: 18)),
            ),
            Text("gitee:https://gitee.com/null_604_6104", style: TextStyles.listTitle.copyWith(fontSize: 18)),
            Gaps.vGap20,
            Text("git:https://github.com/superriver", style: TextStyles.listTitle.copyWith(fontSize: 18)),
            Gaps.vGap20,
            Text(
                "博客:https://blog.csdn"
                ".net/hjjdehao",
                style: TextStyles.listTitle.copyWith(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
