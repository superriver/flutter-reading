import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/ui/widget/search_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTXSearchNavBar extends StatefulWidget implements PreferredSizeWidget{
  final Color barColor;


  final bool isLeading;
  final String titleHint;

  KTXSearchNavBar({Key key, this.barColor, this.isLeading = false,this.titleHint}) : super(key: key);

  @override
  State createState() => KTXSearchNavBarState();

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setHeight(88));
}

class KTXSearchNavBarState extends State<KTXSearchNavBar> {
  Color barColor;

  @override
  void initState() {
    super.initState();
    this.barColor = widget.barColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff04354), Color(0xffff475a)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        margin: EdgeInsets.only(top: 30),
        child: SearchView(titleHint: "搜索"));
  }

  setBarColor(Color color) {
    this.barColor = color;
    setState(() {});
  }


}

