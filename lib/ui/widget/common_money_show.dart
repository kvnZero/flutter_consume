import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';

class MoneyShowWithTipsWidget extends StatelessWidget {
  final String number;
  final String tip;
  final Color moneyFontColor;
  final Color tipFontColor;
  final double moneyFontSize;
  final double tipFontSize;


   MoneyShowWithTipsWidget({Key key, this.number, this.tip, this.moneyFontColor, this.tipFontColor, this.moneyFontSize, this.tipFontSize});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: upx(100),
      child: Column(
        children: [
          Text(number, style: TextStyle(fontSize: upx(moneyFontSize ?? 50), fontWeight: FontWeight.w300, color: moneyFontColor),),
          Text(tip, style: TextStyle(fontSize: upx(tipFontSize ?? 24), color: tipFontColor)),
        ],
      ),
    );
  }
}
