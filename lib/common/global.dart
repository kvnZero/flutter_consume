import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static SharedPreferences _prefs;

  static String iconPath;
  static String name;
  static bool   cloudSync;

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

    cloudSync     = _prefs.getBool("cloudSync");
    if(cloudSync == null){
      saveCloudSync();
    }
  }

  static saveIconPath(){
    _prefs.setString("iconPath", iconPath);
  }

  static saveName(){
    _prefs.setString("name", name);
  }

  static saveCloudSync(){
    _prefs.setBool("cloudSync", cloudSync);
  }
}