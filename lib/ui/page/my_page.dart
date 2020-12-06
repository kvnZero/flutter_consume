import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';

class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  AnimationController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];

    widgets.add(TitleWidget(title: "我的", fontSize: upx(40),));

    widgets.add(
      Column(
        children: [
          ScaleTransition(
            alignment: Alignment.center,
            scale: controller,
            child: Container(
              height: upx(200),
              width: upx(200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.lightBlue[600]
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: upx(20)),
            child: Text('用户名', style: TextStyle(color: Colors.black54, fontSize: upx(42)),),
          )
        ],
      )
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: widgets,
          ),
          Container(
            padding: EdgeInsets.only(bottom: upx(60)),
            child: Text('理智消费, 合理规划。', style: TextStyle(color: Colors.black26),),
          )
        ],
      ),
    );
  }
}

