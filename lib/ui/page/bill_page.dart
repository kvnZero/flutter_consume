import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_record.dart';
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
    Color emColor = Color.fromRGBO(31, 64, 125, 1);
    Color pmColor = Color.fromRGBO(174, 193, 234, 1);
    Color csColor;
    List<Widget> widgets = [];

    var today = DateTime.now();

    if(today.hour >= 0 ){
      csColor = emColor;
    }
    if(today.hour >= 7){
      csColor = amColor;
    }
    if(today.hour >= 16){
      csColor = pmColor;
    }
    if(today.hour >= 20){
      csColor = emColor;
    }


//    widgets.add(TitleWidget(title: "账单", backgroundColor: csColor, fontColor: Colors.white, fontSize: upx(40)));
    widgets.add(IndexMoneyWidget(payedMoney: 300.00, payMoney: 300.00,));
    widgets.add(RecordWidget(id: 1, name: '随便玩玩', money: 10, dateShow: '2/11', payDate: '10-11', type: '支付宝', status: 1,));

    widgets.add(RecordWidget(id: 2, name: '随便玩玩', money: 10, dateShow: '1/11', payDate: '10-11', type: '支付宝', status: 2,));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Column(
              children: widgets,
            ),
          )
        ],
      ),
    );
  }
}