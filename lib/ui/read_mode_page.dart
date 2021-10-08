import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:flutter_reading/ui/article_detail_page.dart';
import 'package:flutter_reading/ui/web_page.dart';

class ReadModePage extends StatefulWidget {
  final dynamic id;
  final dynamic url;

  ReadModePage({this.id, this.url});

  @override
  State<StatefulWidget> createState() {
    return _ReadModePageState();
  }
}

class _ReadModePageState extends State<ReadModePage> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: isChanged ?  WebPage(widget.url):ArticleDetailPage(widget.id)),
          GestureDetector(
            onTap: () {
              setState(() {
                isChanged = !isChanged;
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: ThemeData.dark().backgroundColor,
              height: 50,
              child: Text("切换到网页",style: TextStyles.listTitle.copyWith(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
