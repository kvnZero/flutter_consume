import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_consume/common/common.dart';
import 'package:flutter_consume/common/notifier/GlobalBillModel.dart';
import 'package:flutter_consume/ui/page/add_bill_page.dart';
import 'package:flutter_consume/ui/widget/bill_money.dart';
import 'package:flutter_consume/ui/widget/common_read_record.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> with AutomaticKeepAliveClientMixin{

  double payMoney = 0;
  double payedMoney = 0;

  List billData = [];
  List<Widget> widgets = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    List billData = jsonDecode(GlobalBillModel().billData);
    Future<Map> showData = getBillShowData(billData);
    showData.then((value){
      setState(() {
        widgets.add(
            BillMoneyWidget(
              payedMoney: value['allData']['payed'] / 100,
              payMoney: value['allData']['pay'] / 100,
              addPage: new AddBillPage(),
            )
        );
        for(int i = 0; i<value['billData'].length; i++) {
          widgets.add(ReadRecordWidget(
              id: value['billData'][i]['id'],
              name: value['billData'][i]['title'],
              payMoney: value['billData'][i]['pay'] / 100,
              payedMoney: value['billData'][i]['payed'] / 100,
              dateShow: value['billData'][i]['date_show'],
              payDate: value['billData'][i]['pay_time'],
              type: value['billData'][i]['source']));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

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


