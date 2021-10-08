import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/ui/article_page.dart';
import 'package:flutter_reading/ui/image_page.dart';
import 'package:flutter_reading/ui/person_page.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: "文章",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.image_outlined),
      label: "福利",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: "我的",
    ),
  ];
  final pages = [HomePage(), ArticlePage(), ImagePage(), PersonPage()];

  int _tabIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        fixedColor: Colors.red,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView.builder(physics: NeverScrollableScrollPhysics(),
          onPageChanged: _pageChanged,
          itemCount: pages.length, controller: _pageController, itemBuilder: (context, index) => pages[index]),
    );
  }

  void _pageChanged(int index) {
    setState(() {
      if (_tabIndex != index) _tabIndex = index;
    });
  }

}
