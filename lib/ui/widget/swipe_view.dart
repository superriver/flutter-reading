import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ListView(
     children: [
       Dismissible(key: Key("a"), child: Text("aaa"))
     ],
   );
  }
}

class SwipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Container(width: MediaQuery.of(context).size.width, color: Colors.red),
            new Container(
              width: 180.0,
              color: Colors.lightGreenAccent,
              child: Text("删除"),
            ),
          ],
        ));
  }
}
