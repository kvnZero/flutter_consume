import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';
import 'package:flutter_consume/ui/widget/bill_money.dart';
import 'package:flutter_consume/ui/widget/common_card_button.dart';
import 'package:flutter_consume/ui/widget/common_read_record.dart';
import 'package:flutter_consume/ui/widget/common_title.dart';

class AddBillPage extends StatefulWidget {
  @override
  _AddBillPageState createState() => _AddBillPageState();
}

class _AddBillPageState extends State<AddBillPage> {

  int switchType;

  List<Widget> typeForm() {
    List<Widget> widgetList = [];
    switch(switchType) {
      case 1: {
        // statements;
      }
      break;
      case 2: {
        //statements;
      }
      break;
      default: {
        //还没选择
        widgetList.add(CardButton(title: Text('随便填填', style: TextStyle(fontSize: upx(38)),), icon: Icon(Icons.add, size: upx(40),),
          onTap: (){
            setState(() {
              switchType = 1;
            });
          },
        ));
        widgetList.add(CardButton(title: Text('详细填写', style: TextStyle(fontSize: upx(38)),), icon: Icon(Icons.add_box, size: upx(40),),
          onTap: (){
            setState(() {
              switchType = 2;
            });
          },
        ));
      }
      break;
    }
    return widgetList;
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [];


    widgets.add(TitleWidget(title: "新增账单", fontSize: upx(40),
      rightButton: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.arrow_back, size: upx(36)),
      ),
    ));

    widgets.addAll(typeForm());

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