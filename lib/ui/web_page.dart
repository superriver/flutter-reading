
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/ui/widget/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String url;
  final String titleStr;

  WebPage(this.url, {this.titleStr});

  @override
  State createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  WebViewController _controller;
  String _titleStr;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Platform.isAndroid? () async {
        if (_controller != null) {
          if (await _controller.canGoBack()) {
            await _controller.goBack();
          } else {
            Navigator.pop(context);
          }
          return false;
        } else {
          return true;
        }
      }:null,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.titleStr??''),centerTitle: true,),
        body: Container(
          child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageFinished: (str) {
              // 设置标题
              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  if (Platform.isAndroid) {
                    print(result);
                    String str = result.replaceAll('"', '');
                    _titleStr = str;
                  } else {
                    _titleStr = result;
                  }
                });
              });
            },
          ),
        ),
      ),
    );
  }
}
