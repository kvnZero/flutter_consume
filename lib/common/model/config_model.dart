import 'base_model.dart';

class ConfigModel extends BaseModel {

  ConfigModel(): super("Config");

  Future<List> getByConfig(config) async {
    return getBy('name', config);
  }
}