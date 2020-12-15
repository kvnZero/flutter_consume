import 'package:flutter_consume/common/model/record_model.dart';

Future<List> getMonthData(int month, List billData) async {

  List result = [];

  for(int i = 0; i<billData.length; i++){
    DateTime billDate  = DateTime.parse(billData[i]['create_time']);
    DateTime billStartDate  = new DateTime(billDate.year, billDate.month, -1);
    DateTime monthDate = new DateTime(billDate.year, month, 1);
    DateTime endDate = new DateTime(billDate.year, billDate.month+billData[i]['number']+1, 1);

    Map data = new Map.from(billData[i]);
    if(monthDate.isAfter(billStartDate) && monthDate.isBefore(endDate)){
      //属于账单范围
      List recordData = await RecordModel().getByBillId(billData[i]['id']);
      data['count'] = recordData.length;
      data['status'] = 0;
      recordData.forEach((ele) {
        DateTime recordDate = DateTime.parse(ele['create_time']);
        if(recordDate.month == month || data['status'] == 1){
          data['status'] = 1;
          data['record_id'] = ele['id'];
        }
      });
      result.add(data);
    }
  }

  print(result);
  return result;
}


Future<Map> getMonthMoneyData(int month, List billData) async{

  int payMoney = 0;
  int payedMoney = 0;

  for(int i = 0; i<billData.length; i++){
      List recordData = await RecordModel().getByBillId(billData[i]['id']);
      bool payed = false;
      recordData.forEach((ele) {
        DateTime recordDate = DateTime.parse(ele['create_time']);
        if(recordDate.month == month || payed == true){
          payed = true;
        }
      });

      if(payed){
        payedMoney += billData[i]['pay_money'];
      }else{
        payMoney += billData[i]['pay_money'];
      }
  }

  return new Map.from({"pay": payMoney, "payed": payedMoney});
}

String getTypeText(int type){
  Map types = new Map.from({
    1: '生活日常',
    2: '快乐美食',
    3: '数码产品',
    4: '美妆美容',
    5: '其他'
  });
  return types[type];
}