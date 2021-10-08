import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reading/res/styles.dart';

class PhotoPreview extends StatelessWidget{
  final String imageUrl;
  final String desc;
  PhotoPreview(this.imageUrl,this.desc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Hero(
          tag: imageUrl,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(imageUrl: imageUrl,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(5.0),
                  child: Text(desc??'',style: TextStyles.textStyleWhite12.copyWith(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}