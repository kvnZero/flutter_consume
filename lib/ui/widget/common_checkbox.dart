import 'package:flutter/material.dart';
import 'package:flutter_consume/common/upx.dart';

class CommonCheckbox extends StatefulWidget {
  const CommonCheckbox({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.checkColor,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !widget.value;
        });
        widget.onChanged(_value);
      },
      child: Container(
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
      ),
    );
  }
}
