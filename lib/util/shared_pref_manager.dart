import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static final SharedPrefManager _prefManager = SharedPrefManager._internal();
  static const String token = "_Token";


  Future<String> getString(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(type);
  }

  Future<bool> setString(String type, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(type, value);
  }

  Future<int> getInt(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(type);
  }

  Future<bool> setInt(String type, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(type, value);
  }

  Future<bool> getBool(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(type);
  }

  Future<bool> setBool(String type, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(type, value);
  }

  Future<bool> removeString(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(type);
  }

  SharedPrefManager._internal();

  static SharedPrefManager get instance => _prefManager;

  Future clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
