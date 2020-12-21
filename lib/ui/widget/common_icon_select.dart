import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';

class IconSelectList extends StatefulWidget {

  final List eleList;
  final ValueChanged<int> onSelect;
  final Color unSelectColor;
  final Color selectColor;

  IconSelectList({Key key, this.eleList , this.onSelect, this.unSelectColor = Colors.black, this.selectColor  = Colors.blueAccent}) : super(key: key);

  @override
  _IconSelectListState createState() => _IconSelectListState();
}

class _IconSelectListState extends State<IconSelectList> {

  int selectId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: upx(20)),
        height: upx(100),
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: upx(100),
              childAspectRatio: 0.7
          ),
          shrinkWrap: true,
          children:widget.eleList.map((e){
            return InkWell(
              splashColor: Colors.transparent,
              child: Column(
                children: [
                  Icon(e['icon'], color: selectId == e['id'] ? widget.selectColor : widget.unSelectColor),
                  Text(e['title'], style: TextStyle(color: selectId == e['id'] ? widget.selectColor : widget.unSelectColor),)
                ],
              ),onTap: (){
              setState(() {
                selectId = e['id'];
              });
              widget.onSelect(e['id']);
            },
            );
          }).toList(),
        )
    );
  }
}


