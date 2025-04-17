// SharedPreferences functions 
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUrlHistory(List<String> urls) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('url_history', urls);
  }

  static Future<List<String>> getUrlHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('url_history') ?? [];
  }
}
