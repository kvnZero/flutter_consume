
import 'package:flutter/widgets.dart';

class GlobalBillModel extends ChangeNotifier {

  List _billList = [];
  List get billList => _billList;

  set billList(List billList){
    this._billList = billList;
    notifyListeners();
  }
}