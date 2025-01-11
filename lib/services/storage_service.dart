import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../modal/modal_class.dart';


class StorageService {
  static Future<void> storeUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedInUser', jsonEncode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('loggedInUser');
    if (userString != null) {
      return User.fromJson(jsonDecode(userString));
    }
    return null;
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('loggedInUser');
  }
}
