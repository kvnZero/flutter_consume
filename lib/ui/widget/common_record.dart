import 'package:flutter/material.dart';
import 'package:flutter_consume/common/model/record_model.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/common/Event.dart';
import 'package:flutter_consume/ui/widget/common_checkbox.dart';

class RecordWidget extends StatefulWidget {
  final int id;
  final int recordId;
  final int payNumber;
  final int payedNumber;
  final String name;
  final double money;
  final String payDate;
  final String type;
  final int status;

  RecordWidget({Key key, this.id, this.name, this.money, this.payedNumber, this.payNumber, this.payDate, this.type, this.status, this.recordId});

  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {

  int billId;
  int recordId;
  int payedNumber;
  bool selected = false;

  @override
  void initState() {
    selected = (widget.status == 1);
    billId = widget.id;
    recordId = widget.recordId;
    payedNumber = widget.payedNumber;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RecordWidget oldWidget) {
    setState(() {
      selected = (widget.status == 1);
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          selected = !selected;
        });
        if (selected) {
          if(recordId == 0) {
            Future<int> newRecordId = RecordModel().insert({
              "bill_id": billId
            });
            newRecordId.then((value) {
              setState(() {
                recordId = value;
                payedNumber++;
              });
            });
          }
        }else{
          if(recordId>0) {
            RecordModel().delete(recordId);
            setState(() {
              recordId = 0;
              payedNumber--;
            });
          }
        }
        eventBus.fire(UpdateChangeInEvent(DateTime.now().second));
        eventBus.fire(MoneyChangeInEvent(selected ? widget.money : -widget.money));
      },
      child: Container(
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
                  Text(payedNumber.toString()+'/'+widget.payNumber.toString(), style: TextStyle(fontSize: upx(24), fontWeight: FontWeight.w300, color: Colors.black54), )
                ],),
            )
          ],
        ),
      ),
    );
  }
}
