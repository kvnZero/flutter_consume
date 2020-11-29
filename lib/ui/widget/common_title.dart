import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'dart:ui';
class TitleWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  TitleWidget({Key key, this.title, this.backgroundColor, this.fontColor, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(left: upx(50),right: upx(50),top: MediaQueryData.fromWindow(window).padding.top+10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: fontSize, color: fontColor), ),
          ],
        ),
      ),
    );
  }
}
