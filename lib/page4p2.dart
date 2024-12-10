import 'package:shared_preferences/shared_preferences.dart';

class MemoService {
  // メモを保存する
  Future<void> saveMemo(String key, String memo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, memo);
  }

  // メモを取得する
  Future<String?> getMemo(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}