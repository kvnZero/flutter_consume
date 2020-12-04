import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'dart:ui';
class TitleWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  final Widget rightButton;

  TitleWidget({Key key, this.title, this.backgroundColor, this.fontColor, this.fontSize, this.rightButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];
    widgets.add(Text(title,style: TextStyle(fontSize: fontSize, color: fontColor)));

    if(rightButton != null){
      widgets.add(rightButton);
    }

    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(left: upx(50),right: upx(50),top: MediaQueryData.fromWindow(window).padding.top+10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets,
        ),
      ),
    );
  }
}
