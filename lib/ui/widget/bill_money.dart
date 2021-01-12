import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consume/common/common.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_money_show.dart';
import 'dart:ui';

class BillMoneyWidget extends StatefulWidget {

  final double payedMoney;
  final double payMoney;

  final List billData;

  final Widget addPage;
  final ValueChanged<void> addThen;


  BillMoneyWidget({Key key, this.payedMoney, this.payMoney, this.addPage, this.addThen, this.billData}) : super(key: key);

  @override
  _BillMoneyWidgetState createState() => _BillMoneyWidgetState();
}

class _BillMoneyWidgetState extends State<BillMoneyWidget> {

  double payedMoney;
  double payMoney;
  int touchedIndex;


  @override
  void initState() {
    payedMoney = widget.payedMoney;
    payMoney = widget.payMoney;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BillMoneyWidget oldWidget) {
    setState(() {
      payedMoney = widget.payedMoney;
      payMoney = widget.payMoney;
    });
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

    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(imgBack),
              fit: BoxFit.cover
          )
      ),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: upx(50),right: upx(50),top: MediaQueryData.fromWindow(window).padding.top+10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("全部账单",style: TextStyle(fontSize: upx(40), color: Colors.white)),
                  Container(
                    height: upx(40),
                    width: upx(40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.lightBlue[600]
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.add, size: upx(32), color: Colors.white,),
                      onPressed: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => widget.addPage),
                        ).then(widget.addThen);
                      },
                    ),
                  )
                ],
              ),
              width: double.infinity,
            ),
            Expanded(
              child: AspectRatio(aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sections: showingSections(),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 30,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MoneyShowWithTipsWidget(number: payedMoney.toString(), tip: "已还金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor, moneyFontSize: 40),
                Container(
                  height: upx(100),
                  width: 1,
                  color: Colors.black26,
                ),
                MoneyShowWithTipsWidget(number: payMoney.toString(), tip: "总计金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor, moneyFontSize: 40,),
              ],
            ),
          ],
        ),
      ),
    );

  }

  List<PieChartSectionData> showingSections() {
    List<PieChartSectionData> chartData = new List();
    Map billMoney = new Map();
    int allMoney = 0;
    widget.billData.forEach((element) {
      if(billMoney[element['type']] == null){
        billMoney[element['type']] = 0;
      }
      billMoney[element['type']] += element['pay_money'];
      allMoney += element['pay_money'];
    });

    billMoney.forEach((key, value) {
      final double fontSize = 16;
      final double radius = 50;
      chartData.add(new PieChartSectionData(
        color: Color.fromRGBO(Random().nextInt(100), Random().nextInt(256), Random().nextInt(256), 1),
        value: value * 1.00,
        title: ((value/allMoney)*100).round().toString()+'%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
      ));
    });
    return chartData;
  }
}
