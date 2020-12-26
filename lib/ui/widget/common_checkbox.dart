import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';

class CommonCheckbox extends StatefulWidget {
  const CommonCheckbox({
    Key key,
    @required this.value,
    this.activeColor,
    this.checkColor,
  }) : super(key: key);

  final bool value;
  final Color activeColor;
  final Color checkColor;


  @override
  _CommonCheckboxState createState() => _CommonCheckboxState();
}

class _CommonCheckboxState extends State<CommonCheckbox> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonCheckbox oldWidget) {
    // TODO: implement didUpdateWidget
    setState(() {
      _value = widget.value;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: upx(10),
      width: upx(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.checkColor ?? Colors.blue),
      child: _value
          ? Icon(
        Icons.check,
        size: upx(40),
        color: widget.activeColor ?? Colors.white,
      )
          : Icon(
        Icons.check,
        size: upx(40),
        color: Colors.blue,
      ),
    );
  }
}
