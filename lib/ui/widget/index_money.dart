import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_money_show.dart';

class IndexMoneyWidget extends StatefulWidget {

  final double payedMoney;
  final double payMoney;

  IndexMoneyWidget({Key key, this.payedMoney, this.payMoney}) : super(key: key);

  @override
  _IndexMoneyWidgetState createState() => _IndexMoneyWidgetState();
}

class _IndexMoneyWidgetState extends State<IndexMoneyWidget> {

  String month;

  @override
  void initState() {
    // TODO: implement initState
    month = "12";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var today = DateTime.now();

    String imgBack;
    Color moneyFontColor;
    Color tipFontColor;

    if(today.hour>7){
      imgBack = "assets/images/am-back.png";
    }
    if(today.hour>16){
      imgBack = "assets/images/pm-back.png";
    }
    if(today.hour>20){
      imgBack = "assets/images/em-back.png";
      tipFontColor = Colors.white60;
      moneyFontColor = Colors.white;
    }


    return Column(
      children: [
        Container(
            width: double.infinity,
            height: upx(250),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(imgBack),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MoneyShowWithTipsWidget(number: widget.payedMoney, tip: "已还金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor,),
                    Container(
                      height: upx(150),
                      width: 1,
                      color: Colors.black26,
                    ),
                    MoneyShowWithTipsWidget(number: widget.payMoney, tip: "待还金额", moneyFontColor: moneyFontColor, tipFontColor: tipFontColor,),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: upx(20)),
                  child: Text("${this.month}月账单", style: TextStyle(fontSize: upx(30), color: tipFontColor),),
                  height: upx(50),
                )
              ],
            )
        ),
      ],
    );
  }
}
