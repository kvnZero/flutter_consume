import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_consume/common/notifier/GlobalBillModel.dart';
import 'package:flutter_consume/common/common.dart';
import 'package:flutter_consume/ui/widget/common_record.dart';
import 'package:flutter_consume/ui/widget/index_money.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> with AutomaticKeepAliveClientMixin{

  DateTime today = DateTime.now();
  List<Widget> widgets = [];

  int month;

  @override
  void initState() {
    super.initState();
    month = today.month;

    List billData = jsonDecode(GlobalBillModel().billData);
    Future<Map> monthData = getMonthMoneyData(month, billData);
    monthData.then((e) {
      widgets.add(IndexMoneyWidget(payedMoney: e['payed']/100, payMoney: e['pay']/100, month: month,));
    });
    Future<List> recordData = getMonthData(month, billData);
    recordData.then((e) {
      e.forEach((element) {
        widgets.add(RecordWidget(
          id: element['id'],
          name: element['title'],
          money: element['pay_money']/100,
          dateShow: element['count'].toString()+'/'+element['number'].toString(),
          payDate: element['pay_time'],
          type: getTypeText(element['type']),
          status: element['status'],
          recordId: element['record_id'] ?? 0,
        ));
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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