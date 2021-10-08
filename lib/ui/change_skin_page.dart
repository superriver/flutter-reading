import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/main.dart';
import 'package:flutter_reading/provider/theme_provider.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/ui/widget/app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final  themeProvider = ChangeNotifierProvider((_) => ThemeProvider());
class ChangeSkinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangeSkinPageState();
  }
}

class _ChangeSkinPageState extends State<ChangeSkinPage> {
  var _colorKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("颜色主题"),centerTitle: true,
      ),
      body: Container(
        // leading: Icon(Icons.color_lens),
        // initiallyExpanded: false,
        margin: EdgeInsets.all(10),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: themeColorMap.keys.map((key) {
            Color value = themeColorMap[key];
            return InkWell(
              onTap: () {
                setState(() {
                  _colorKey = key;
                });
                SpUtil.putString("key_theme_color",_colorKey);
                print("key_theme_color:${SpUtil.getString("key_theme_color")}");
                context.read(themeProvider).setTheme(value);

              },
              child: Container(
                width: 50,
                height: 50,
                color: value,
                child: _colorKey == key
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
