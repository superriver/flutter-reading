import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dimens.dart';

class TextStyles {
  static TextStyle listTitle = TextStyle(fontSize: Dimens.font_sp16, color: Colors.black);
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
//    color: Colours.text_normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
//    color: Colours.text_gray,
  );

  static TextStyle textStyleWhite12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colors.white,
  );
}

class Decorations {
//  static Decoration bottom = BoxDecoration(
//      border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider)));
}
