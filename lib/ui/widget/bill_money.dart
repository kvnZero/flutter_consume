import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_money_show.dart';
import 'dart:ui';

class BillMoneyWidget extends StatefulWidget {

  final double payedMoney;
  final double payMoney;

  final Widget addPage;


  BillMoneyWidget({Key key, this.payedMoney, this.payMoney, this.addPage}) : super(key: key);

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
                        );
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
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
