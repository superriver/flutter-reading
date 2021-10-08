import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showCenterDialog(context) {
  return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("浏览方式"),
          children: [
            SimpleDialogOption(
              child: Text("正常浏览"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text("网页浏览"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
