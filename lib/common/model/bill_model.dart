import 'base_model.dart';

class BillModel extends BaseModel {

  BillModel(): super("Bill");

  Future<List> getByType(type) async {
    return getBy('type', type);
  }

  Future<List> getBySource(type) async {
    return getBy('source', type);
  }
}