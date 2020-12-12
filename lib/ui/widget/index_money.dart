import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/common/MoneyEvent.dart';
import 'package:flutter_consume/ui/widget/common_money_show.dart';
import 'dart:ui';

class IndexMoneyWidget extends StatefulWidget {

  final double payedMoney;
  final double payMoney;
  final int month;

  IndexMoneyWidget({Key key, this.payedMoney, this.payMoney, this.month}) : super(key: key);

  @override
  _IndexMoneyWidgetState createState() => _IndexMoneyWidgetState();
}

class _IndexMoneyWidgetState extends State<IndexMoneyWidget> with SingleTickerProviderStateMixin{

  String month;
  double payedMoney;
  double payMoney;

  double newPayedMoney;
  double newPayMoney;

  AnimationController controller;
  Animation<double> payAnimation;
  Animation<double> payedAnimation;


  @override
  void initState() {
    payedMoney = widget.payedMoney;
    payMoney = widget.payMoney;

    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    payedAnimation = new Tween<double>(
        begin: 0,
        end: payedMoney
    ).animate(new CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    payAnimation = new Tween<double>(
        begin: 0,
        end: payMoney
    ).animate(new CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    controller.forward(from: 0.0);

    eventBus.on<MoneyChangeInEvent>().listen((event) {
      setState(() {
        newPayedMoney = payedMoney + event.number;
        newPayMoney = payMoney - event.number;
        payedAnimation = new Tween<double>(
            begin: payedMoney,
            end: newPayedMoney
        ).animate(new CurvedAnimation(
          curve: Curves.linear,
          parent: controller,
        ));

        payAnimation = new Tween<double>(
            begin: payMoney,
            end: newPayMoney
        ).animate(new CurvedAnimation(
          curve: Curves.linear,
          parent: controller,
        ));
        payedMoney = newPayedMoney;
        payMoney   = newPayMoney;
      });
      controller.forward(from: 0.0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var today = DateTime.now();

    String imgBack;
    Color moneyFontColor;
    Color tipFontColor;

    if(today.hour >= 0 ){
      imgBack = "assets/images/em-back.png";
      tipFontColor = Colors.white60;
      moneyFontColor = Colors.white;
    }
    if(today.hour >=7 ){
      imgBack = "assets/images/am-back.png";
    }
    if(today.hour >= 16){
      imgBack = "assets/images/pm-back.png";
    }
    if(today.hour >= 20){
      imgBack = "assets/images/em-back.png";
      tipFontColor = Colors.white60;
      moneyFontColor = Colors.white;
    }


    return Column(
      children: [
        Container(
            width: double.infinity,
            height: upx(380),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(imgBack),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: upx(50),right: upx(50),top: MediaQueryData.fromWindow(window).padding.top+10),
                  child: Text("本月账单",style: TextStyle(fontSize: upx(40), color: Colors.white)),
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new AnimatedBuilder(
                      animation: payedAnimation,
                      builder: (BuildContext context, Widget child) {
                        return new MoneyShowWithTipsWidget(number: payedAnimation.value.toStringAsFixed(2), tip: "已还金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor,);
                      },
                    ),
                    Container(
                      height: upx(150),
                      width: 1,
                      color: Colors.black26,
                    ),
                    new AnimatedBuilder(
                      animation: payAnimation,
                      builder: (BuildContext context, Widget child) {
                        return new MoneyShowWithTipsWidget(number: payAnimation.value.toStringAsFixed(2), tip: "待还金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor,);
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: upx(20)),
                  child: Text("${widget.month.toString()}月账单", style: TextStyle(fontSize: upx(30), color: tipFontColor),),
                  height: upx(50),
                )
              ],
            )
        ),
      ],
    );
  }
}
