import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consume/common/model/bill_model.dart';
import 'package:flutter_consume/common/model/record_model.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/common/Event.dart';

class ReadRecordWidget extends StatefulWidget {
  final int id;
  final String name;
  final double payedMoney;
  final double payMoney;
  final String dateShow;
  final String payDate;
  final String source;
  final IconData typeIcon;

  ReadRecordWidget({Key key, this.id, this.name, this.payedMoney, this.payMoney, this.dateShow, this.payDate, this.typeIcon, this.source});

  @override
  _ReadRecordWidgetState createState() => _ReadRecordWidgetState();
}

class _ReadRecordWidgetState extends State<ReadRecordWidget> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(upx(15)),
          padding: EdgeInsets.all(upx(5)),
          height: upx(130),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: upx(50),
                      height: upx(50),
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(widget.typeIcon, size: upx(38),)
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:upx(400),
                            child: Text(widget.name, style: TextStyle(fontSize: upx(36),fontWeight: FontWeight.w400, color: Colors.black54),),
                          ),
                          Container(
                            width: upx(400),
                            child: Text(widget.source, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
                          ),
                        ],
                      ),
                      Container(
                        width: upx(400),
                        child: Text("还款日期："+widget.payDate, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
                      )
                    ],),
                ],
              ),
              Container(
                width: upx(180),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('待还:'+widget.payMoney.toString(), style: TextStyle(fontSize: upx(24), fontWeight: FontWeight.w500),),
                    Text('已还:'+widget.payedMoney.toString(), style: TextStyle(fontSize: upx(24), fontWeight: FontWeight.w500),),

                    Text('剩余:'+widget.dateShow, style: TextStyle(fontSize: upx(24), fontWeight: FontWeight.w300, color: Colors.black54), )
                  ],),
              )
            ],
          ),
        ),
        Container(
          height: 0.2,
          width: upx(600),
          color: Colors.black,
        )
      ],),
      onDoubleTap: (){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: '是否确定删除该条记录',
          desc: '删除后不能恢复记录, 还款记录也将被删除',
          btnOkText: '删除',
          btnOkOnPress: () {
            BillModel().delete(widget.id);
            RecordModel().deleteByBillId(widget.id);
            eventBus.fire(UpdateChangeInEvent(DateTime.now().second));
          },
          btnCancelText: '不删了',
          btnCancelOnPress: () {
          },
        )..show();
      },
    );
  }
}
