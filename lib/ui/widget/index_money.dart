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
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: upx(250),
            color: Colors.blueAccent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MoneyShowWithTipsWidget(number: widget.payedMoney, tip: "已还金额",),
                    Container(
                      height: upx(150),
                      width: 1,
                      color: Colors.black26,
                    ),
                    MoneyShowWithTipsWidget(number: widget.payMoney, tip: "待还金额",),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: upx(20)),
                  child: Text("${this.month}月账单", style: TextStyle(fontSize: upx(30)),),
                  height: upx(50),
                )
              ],
            )
        ),
      ],
    );
  }
}
