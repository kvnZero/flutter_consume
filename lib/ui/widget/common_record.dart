import 'package:flutter/material.dart';

class RecordWidget extends StatefulWidget {
  final int id;
  final String name;
  final double money;
  final String dateShow;
  final String payDate;
  final String type;
  final int status;

  RecordWidget({Key key, this.id, this.name, this.money, this.dateShow, this.payDate, this.type, this.status})
  
  @override
  _RecordWidgetState createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  @override
  Widget build(BuildContext context) {

//    Image.network("", fit: BoxFit.fill,)'

    return Container(
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              child: Padding(padding: EdgeInsets.all(0),
                child:ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Icon(Icons.food_bank)
                ),)
          ),
          Column(children: [
            Container(
              width: 150,
              child: Text("Hello", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
            ),
            Container(
              width: 150,
              child: Text("电子垃圾", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
            ),
            Container(
              width: 150,
              child: Text("12-10", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black26),),
            )
          ],),
          Column(children: [
            Text(widget.money.toString()),
            Text(widget.dateShow,)
          ],),
        ],
      ),
    );
  }
}
