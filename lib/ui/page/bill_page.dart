import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';
import 'package:flutter_consume/ui/widget/index_money.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: "账单", backgroundColor: Colors.blueAccent, fontColor: Colors.white, fontSize: upx(40),),
        IndexMoneyWidget(payedMoney: 300.00, payMoney: 300.00,),
      ],
    );
  }
}