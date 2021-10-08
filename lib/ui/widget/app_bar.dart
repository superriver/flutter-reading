// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_reading/res/styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /// 自定义AppBar
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({
//     Key key,
//     this.backgroundColor,
//     this.actionName: '',
//     this.action,
//     this.backImg: 'assets/images/ic_back_black.png',
//     this.onPressed,
//     this.isBack: true,
//     this.gradientColors,
//     this.backCallBack,
//     this.title,
//     this.titleStr,
//   }) : super(key: key);
//
//   final Color backgroundColor;
//   final Widget title;
//   final Widget action;
//   final String backImg;
//   final String actionName;
//   final VoidCallback onPressed;
//   final bool isBack;
//   final List<Color> gradientColors;
//   final VoidCallback backCallBack;
//   final String titleStr;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final ColorScheme colorScheme = theme.colorScheme;
//     final AppBarTheme appBarTheme = AppBarTheme.of(context);
//     final Color _backgroundColor = backgroundColor ?? theme.primaryColor;
//
//     // if (backgroundColor == null) {
//     //   _backgroundColor =ThemeData.;
//     // } else {
//     //   _backgroundColor = backgroundColor;
//     // }
//
//     SystemUiOverlayStyle _overlayStyle = ThemeData.estimateBrightnessForColor(_backgroundColor) == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: _overlayStyle,
//       child: Material(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xfff04354), Color(0xffff475a)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: SafeArea(
//             child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
//               Semantics(
//                   namesRoute: true,
//                   header: true,
//                   child: Center(
//                     child: Padding(
//                       padding: EdgeInsets.only(right: isBack ? 30 : 10, left: isBack ? 50.0 : 10.0),
//                       child: title ??
//                           Text(
//                             titleStr,
//                             style: TextStyles.listTitle.copyWith(color: Colors.white),
//                           ),
//                     ),
//                   )),
//               Offstage(
//                   offstage: !isBack,
//                   child: IconButton(
//                     onPressed: backCallBack ??
//                         () {
//                           FocusScope.of(context).unfocus();
//                           Navigator.maybePop(context);
//                         },
//                     tooltip: 'Back',
//                     padding: const EdgeInsets.only(
//                       top: 12.0,
//                       bottom: 16.0,
//                     ),
//                     icon: Icon(
//                       Icons.arrow_back_ios_sharp,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//                   )),
//               Positioned(
//                 right: 0.0,
//                 child: Theme(
//                   data: Theme.of(context).copyWith(
//                       buttonTheme: ButtonThemeData(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     minWidth: 60.0,
//                   )),
//                   child: action != null
//                       ? action
//                       : FlatButton(
//                           child: Text(actionName, key: const Key('actionName')),
//                           textColor: Colors.white,
//                           highlightColor: Colors.transparent,
//                           onPressed: onPressed,
//                         ),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(ScreenUtil().setHeight(44));
// }
