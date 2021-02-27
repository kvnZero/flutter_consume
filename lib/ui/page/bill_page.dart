import 'package:flutter/material.dart';
import 'package:flutter_consume/common/Event.dart';
import 'package:flutter_consume/common/model/bill_model.dart';
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

  int year;
  int month;
  int flushVersion = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    year  = today.year;
    month = today.month;
    BillModel().getAll().then((value) {
      _flush(value);
    });
    eventBus.on<UpdateChangeInEvent>().listen((event) {
      if(event.version != flushVersion && event.all == true){
        BillModel().getAll().then((value) {
          _flush(value);
        });
        setState(() {
          flushVersion = event.version;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
    Future<Map> monthData = getMonthMoneyData(month, billList, year: year);
    monthData.then((monthData) {
      setState(() {
        widgets.clear();
        widgets.add(IndexMoneyWidget(payedMoney: monthData['payed']/100, payMoney: monthData['pay']/100, month: month,
            onDateChange: (date){
              setState(() {
                this.month = date.month;
                this.year  = date.year;
              });
              BillModel().getAll().then((value) {
                _flush(value);
              });
          },));
      });
      _flushData(billList); //需要拆分 或者可能导致被提前加载后clear()
    });
  }

  Future<void> _flushData(List billList) async{
    Future<List> recordData = getMonthData(month, billList, year: year);
    recordData.then((recordData) {
      if(recordData.isEmpty){
        setState(() {
          widgets.add(Container(
            margin: EdgeInsets.only(top: 540),
            child: Text("还没添加账单记录, 快去添加吧", style: TextStyle(color: Colors.black54),),
          ));
        });
      }else{
        recordData.forEach((element) {
          setState(() {
            widgets.add(RecordWidget(
              id: element['id'],
              name: element['title'],
              money: element['pay_money']/100,
              payNumber: element['number'],
              payedNumber: element['count'],
              payDate: element['pay_time'],
              type: getTypeText(element['type']),
              status: element['status'],
              recordId: element['record_id'] ?? 0,
              month : month
            ));
          });
        });
      }
    });
  }
}