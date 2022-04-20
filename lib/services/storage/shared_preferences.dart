import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class SharedPreferencesService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<SharedPreferences> get prefs => _prefs;

  // For Theme
  static Future<void> setTheme(bool value) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setBool(VariableConst.keyTheme, value);
  }
}
