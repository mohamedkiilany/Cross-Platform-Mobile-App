import 'package:shared_preferences/shared_preferences.dart';

class CounterDb {
  SharedPreferences? preferences;
  static const String key = "count";

  Future<SharedPreferences?> get preferenceInstance async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
      return preferences;
    } else {
      return preferences;
    }
  }

  Future<void> setCount(int count) async {
    final preferences = await preferenceInstance;
    preferences?.setInt(key, count);
  }

  Future<int> getCount() async {
    final preferences = await preferenceInstance;
    return preferences?.getInt(key) ?? 0;
  }
}
