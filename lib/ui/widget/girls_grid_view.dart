
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/model/girl_entity.dart';
import 'package:flutter_reading/res/styles.dart';
import 'package:flutter_reading/ui/widget/photo_preview.dart';
import 'package:get/get.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class GirlItemView extends StatelessWidget{
  final GirlData data;
  GirlItemView(this.data);
  @override
  Widget build(BuildContext context) {

     return  GestureDetector(
       onTap: (){
         Get.to(()=>PhotoPreview(data.url,data.desc),opaque: false);
       },
       child: Stack(
         alignment: Alignment.bottomCenter,
         children: [
           CachedNetworkImage(imageUrl: data.url,fit: BoxFit.cover,),
           Container(
             height: 50,
             alignment: Alignment.center,
             padding: EdgeInsets.all(5.0),
             color: Colors.black.withOpacity(0.2),
             child: Text(data.desc,style: TextStyles.textStyleWhite12,overflow: TextOverflow.ellipsis,maxLines: 2,),
           ),
         ],
       ),
     );
  }

}