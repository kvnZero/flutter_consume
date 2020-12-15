import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {

  final Widget title;
  final Icon icon;
  final GestureTapCallback onTap;

  CardButton({Key key, this.title, this.onTap, this.icon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            elevation: 0.3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      this.icon ?? null,
                      this.title ?? '',
                    ],
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            )
        ),
      ),
      onTap: onTap,
    );
  }
}
