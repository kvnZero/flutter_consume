import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/common_read_record.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];



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
          TitleWidget(title: "全部账单", fontSize: upx(40),
              rightButton: Container(
                height: upx(50),
                width: upx(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blueAccent
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.add, size: upx(38), color: Colors.white,), onPressed: (){},
                ),
              )
          ),
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


