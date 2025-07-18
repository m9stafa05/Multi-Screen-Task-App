import 'dart:convert';

import 'package:multi_screen_task_app/core/utils/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
static const String _userKey = 'user_data';

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

static Future<UserModel?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);

    if (jsonString == null) return null;

    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel.fromJson(json);
  }
  
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
