import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';
import 'package:vibration/vibration.dart';

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

class _MyPageState extends State<MyPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController controller;

  bool cloudSync = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
            margin: EdgeInsets.only(top: upx(20), bottom: upx(20)),
            child: Text('用户名', style: TextStyle(color: Colors.black54, fontSize: upx(42)),),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            color: Color.fromRGBO(255, 255, 255, 0.8),
            elevation: 0.5,
            margin: EdgeInsets.symmetric(horizontal: upx(30)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: upx(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("云同步(待开发)"),
                      Switch(value: cloudSync, onChanged: (value){
                        setState(() {
                          cloudSync = value;
                        });
                      })
                    ],
                  ),
                  FlatButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    textTheme: ButtonTextTheme.accent,
                      padding: EdgeInsets.zero,
                        minWidth: double.infinity,
                        onPressed: (){
                          Vibration.vibrate(duration: 50);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("清空全部数据"),
                          ],
                        )
                  ),
                ],
              ),
            ),
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

