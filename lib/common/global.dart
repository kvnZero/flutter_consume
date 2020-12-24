import 'dart:convert';

import 'package:flutter_consume/common/model/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static SharedPreferences _prefs;

//  static String billData;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
    var data = _prefs.getString("bill_data");
//    if(data == null){
//      billData = jsonEncode(await BillModel().getAll());
//      saveBillData();
//    }
  }

//  static saveBillData(){
//    _prefs.setString("bill_data", billData);
//  }
}