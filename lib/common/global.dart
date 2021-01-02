import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static SharedPreferences _prefs;

  static String iconPath;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();

    iconPath = _prefs.getString("iconPath");
    if(iconPath == null){
      saveIconPath();
    }
  }

  static saveIconPath(){
    _prefs.setString("iconPath", iconPath);
  }
}