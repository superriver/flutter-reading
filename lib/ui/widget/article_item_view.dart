import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/article_entity.dart';
import 'package:flutter_reading/res/colors.dart';
import 'package:flutter_reading/res/gaps.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:get/get.dart';

import '../article_detail_page.dart';

class ArticleItemView extends StatelessWidget {
  final dynamic data;

  ArticleItemView(this.data);

  @override
  Widget build(BuildContext context) {
    String desc = data.desc;
    if (data.desc.length > 50) {
      desc = data.desc.substring(0, 50) + "...";
    }
    String imageUrl;
    if (data is ArticleData) {
      if (!ObjectUtil.isEmptyList(data.images)) {
        imageUrl = data.images[0];
      }
    } else {
      imageUrl = data.imageUrl;
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => ArticleDetailPage(
              data.id,
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(163, 195, 214, 0.5),
              offset: Offset(0, 4),
              blurRadius: 4.5,
              spreadRadius: 1,
            )
          ],
          border: new Border.all(
            width: 0.5,
            color: AppColors.cf0f3f5,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ObjectUtil.isEmptyString(imageUrl)
                    ? Container(
                        height: 80,
                        width: 120,
                        color: AppColors.cb2b2b2,
                      )
                    : CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        height: 80,
                        width: 120,
                        errorWidget: (context, url, error) => Container(
                          height: 80,
                          width: 120,
                          color: AppColors.cb2b2b2,
                        ),
                      ),
                Gaps.hGap10,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyles.listTitle.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gaps.vGap10,
                      Text(desc, style: TextStyles.listContent, maxLines: 3, overflow: TextOverflow.ellipsis),
                      Gaps.vGap10,
                    ],
                  ),
                )
              ],
            ),
            Gaps.vGap15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data.author} 发布于"),
                Text(data.createdAt),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
