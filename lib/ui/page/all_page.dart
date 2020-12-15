import 'package:flutter/material.dart';
import 'package:flutter_consume/ui/page/add_bill_page.dart';
import 'package:flutter_consume/ui/widget/bill_money.dart';
import 'package:flutter_consume/ui/widget/common_read_record.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];

    widgets.add(BillMoneyWidget(payedMoney: 300.00, payMoney: 300.00, addPage: new AddBillPage(),));

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


