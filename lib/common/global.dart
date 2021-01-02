import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static SharedPreferences _prefs;

  static String iconPath;
  static String name;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();

    iconPath = _prefs.getString("iconPath");
    if(iconPath == null){
      saveIconPath();
    }

    name     = _prefs.getString("name");
    if(name == null){
      saveName();
    }
  }

  static saveIconPath(){
    _prefs.setString("iconPath", iconPath);
  }

  static saveName(){
    _prefs.setString("name", name);
  }
}