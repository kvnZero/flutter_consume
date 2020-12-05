import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/bill_money.dart';
import 'package:flutter_consume/ui/widget/common_read_record.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
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


//    widgets.add(TitleWidget(title: "全部账单", fontSize: upx(40),
//        backgroundColor: csColor, fontColor: Colors.white,
//        rightButton: Container(
//          height: upx(40),
//          width: upx(40),
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(40),
//              color: Colors.blueAccent
//          ),
//          child: IconButton(
//            padding: EdgeInsets.zero,
//            splashColor: Colors.transparent,
//            icon: Icon(Icons.add, size: upx(32), color: Colors.white,), onPressed: (){},
//          ),
//        )
//    ));
    widgets.add(BillMoneyWidget(payedMoney: 300.00, payMoney: 300.00,));

    widgets.add(ReadRecordWidget(id: 1, name: '随便玩玩', payMoney: 10, payedMoney: 10, dateShow: '2/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));

    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));
    widgets.add(ReadRecordWidget(id: 2, name: '随便玩玩', payMoney: 10000000, payedMoney: 20, dateShow: '1/11', payDate: '10-11', type: '支付宝'));


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Column(
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }
}


