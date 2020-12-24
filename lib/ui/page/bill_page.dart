import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_consume/common/model/bill_model.dart';
import 'package:flutter_consume/common/common.dart';
import 'package:flutter_consume/ui/widget/common_record.dart';
import 'package:flutter_consume/ui/widget/index_money.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage>{

  DateTime today = DateTime.now();
  List<Widget> widgets = [];

  int month;

  @override
  void initState() {
    super.initState();
    month = today.month;
    BillModel().getAll().then((value) {
      _flush(value);
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
            child: new Column(children: widgets)
          )
        ],
      ),
    );
  }

  Future<void> _flush(List billList) async{
      Future<Map> monthData = getMonthMoneyData(month, billList);
      monthData.then((monthData) {
        setState(() {
          widgets.add(IndexMoneyWidget(payedMoney: monthData['payed']/100, payMoney: monthData['pay']/100, month: month,));
        });
      });
      Future<List> recordData = getMonthData(month, billList);
      recordData.then((recordData) {
        recordData.forEach((element) {
          setState(() {
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
      });
  }
}