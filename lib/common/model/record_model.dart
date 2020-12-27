import 'base_model.dart';

class RecordModel extends BaseModel {

  RecordModel(): super("Record");

  Future<List> getByBillId(id) async {
    return getBy('bill_id', id);
  }

  Future<bool> deleteByBillId(billId) {
    return deleteBy("bill_id", billId);
  }
}