//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_reading/model/article_dao.dart';
// import 'package:flutter_reading/res/dimens.dart';
// import 'package:flutter_reading/res/styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class HotArticleListView extends StatelessWidget{
//   final int index;
//   HotArticleListView(this.index);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               "本周最热文章",
//               style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
//             ),
//             // InkWell(
//             //   onTap: (){
//             //     // Get.to(() => ShopListPage(isSearchAll: false,), opaque: false);
//             //   },
//             //   child: Text(
//             //     "更多",
//             //     style: TextStyles.textSize15.copyWith(color: AppColors.c999999),
//             //   ),
//             // )
//           ],
//         ),
//         Gaps.vGap10,
//         ListView.builder(
//           padding: EdgeInsets.zero,
//           itemBuilder: (context, index) {
//             ArticleData data = articleList[index];
//              return Container(child: Row(
//               children: [
//                 CachedNetworkImage(imageUrl: data.images[0],fit: BoxFit.cover,),
//                 Column(
//                   children: [
//                     Text(data.title,style: TextStyles.listTitle,),
//                     Text(data.desc),
//                     Text(data.author),
//                   ],
//                 )
//               ],
//             ),);
//           },
//           itemCount: articleList?.length ?? 0,
//         ),
//       ],
//     );
//   }
//
// }
//
