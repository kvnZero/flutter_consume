import 'package:flutter/material.dart';
import 'package:flutter_consume/common/common.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/common/Event.dart';
import 'package:flutter_consume/ui/widget/common_money_show.dart';
import 'dart:ui';
import 'package:flutter_picker/flutter_picker.dart';

class IndexMoneyWidget extends StatefulWidget {

  final double payedMoney;
  final double payMoney;
  final int month;
  final ValueChanged<DateTime> onDateChange;

  IndexMoneyWidget({Key key, this.payedMoney, this.payMoney, this.month, this.onDateChange}) : super(key: key);

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

  List<List> _dateData = [[], [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ,11, 12
  ]];

  @override
  void initState() {

    for(int i = DateTime.now().year+5; i > 2010; i--){
      _dateData[0].add(i);
    }

    payedMoney = widget.payedMoney;
    payMoney = widget.payMoney;
    month    = widget.month.toString();
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
  void didUpdateWidget(covariant IndexMoneyWidget oldWidget) {
    setState(() {
      payAnimation = new Tween<double>(
          begin: payMoney,
          end: widget.payMoney
      ).animate(new CurvedAnimation(
        curve: Curves.linear,
        parent: controller
      ));
      payedAnimation = new Tween<double>(
          begin: payedMoney,
          end: widget.payedMoney
      ).animate(new CurvedAnimation(
        curve: Curves.linear,
        parent: controller
      ));
      payedMoney = widget.payedMoney;
      payMoney = widget.payMoney;
    });
    controller.forward(from: 0.0);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    var today = DateTime.now();

    Map timeMap;
    String imgBack;
    Color moneyFontColor;
    Color tipFontColor;

    timeMap = getTimeImagePath();
    if(timeMap['time'] == 'em'){
      tipFontColor = Colors.white60;
      moneyFontColor = Colors.white;
    }
    imgBack = timeMap['path'];

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
                  child: Text("本月账单",style: TextStyle(fontSize: upx(40), color: tipFontColor)),
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
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$month月账单", style: TextStyle(fontSize: upx(30), color: tipFontColor),),
                        Icon(Icons.unfold_more, size: upx(30), color: tipFontColor)
                      ],  
                    ),
                    onTap: (){
                      new Picker(
                          adapter: PickerDataAdapter<String>(pickerdata: _dateData, isArray: true),
                          hideHeader: true,
                          title: new Text("请选择日期"),
                          onConfirm: (Picker picker, List value) {
                            value = picker.getSelectedValues();
                            if(widget.onDateChange != null){
                              widget.onDateChange(new DateTime(int.parse(value[0]), int.parse(value[1])));
                            }
                            setState(() {
                              month = value[1];
                            });
                          },
                      ).showDialog(context);
                    },
                  ),
                  height: upx(50),
                )
              ],
            )
        ),
      ],
    );
  }
}
