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

    Color amColor = Color.fromRGBO(243, 226, 171, 1);
    Color emColor = Color.fromRGBO(40, 61, 122, 1);
    Color pmColor = Color.fromRGBO(174, 193, 234, 1);
    Color csColor;

    var today = DateTime.now();

    if(today.hour>7){
      csColor = amColor;
    }
    if(today.hour>16){
      csColor = pmColor;
    }
    if(today.hour>20){
      csColor = emColor;
    }



    return Column(
      children: [
        TitleWidget(title: "账单", backgroundColor: csColor, fontColor: Colors.white, fontSize: upx(40),),
        IndexMoneyWidget(payedMoney: 300.00, payMoney: 300.00,),
      ],
    );
  }
}