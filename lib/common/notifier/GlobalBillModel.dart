import 'package:flutter/cupertino.dart';
import 'package:flutter_consume/common/global.dart';

class GlobalBillModel extends ChangeNotifier {
  String get _billData => Global.billData;

  String get billData => _billData;

  @override
  void notifyListeners() {
    Global.saveBillData();
    super.notifyListeners();
  }

  set billData(String text){
    notifyListeners();
  }
}