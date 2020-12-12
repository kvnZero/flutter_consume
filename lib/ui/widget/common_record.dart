import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/common/MoneyEvent.dart';
import 'package:flutter_consume/ui/widget/common_checkbox.dart';

class RecordWidget extends StatefulWidget {
  final int id;
  final String name;
  final double money;
  final String dateShow;
  final String payDate;
  final String type;
  final int status;

  RecordWidget({Key key, this.id, this.name, this.money, this.dateShow, this.payDate, this.type, this.status});

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {

  bool selected = false;

  @override
  void initState() {
    if(widget.status == 2){
      //已勾选
      selected = true;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(upx(15)),
      padding: EdgeInsets.all(upx(5)),
      height: upx(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: upx(50),
                  height: upx(50),
                  margin: EdgeInsets.only(right: 10),
                  child: CommonCheckbox(
                    value: selected,
                    activeColor: Colors.white,
                    checkColor: Colors.blueAccent,
                    onChanged: (value){
                      setState(() {
                        selected = value;
                      });
                      eventBus.fire(MoneyChangeInEvent(selected ? widget.money : -widget.money));
                    },
                  )
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:upx(500),
                      child: Text(widget.name, style: TextStyle(fontSize: upx(42),fontWeight: FontWeight.w400, color: Colors.black54, decoration: selected ? TextDecoration.lineThrough : null,),),
                    ),
                    Container(
                      width: upx(500),
                      child: Text(widget.type, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
                    ),
                  ],
                ),
                Container(
                  width: upx(500),
                  child: Text("还款日期："+widget.payDate+(selected ? '(已还)' : ''), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
                )
              ],),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text(widget.money.toString(), style: TextStyle(fontSize: upx(42), fontWeight: FontWeight.w500),),
              Text(widget.dateShow, style: TextStyle(fontSize: upx(24), fontWeight: FontWeight.w300, color: Colors.black54), )
            ],),
          )
        ],
      ),
    );
  }
}
