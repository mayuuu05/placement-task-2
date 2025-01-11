import 'package:http/http.dart' as http;
import 'dart:convert';
import '../modal/modal_class.dart';


class AuthService {
  static Future<User?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      return null;
    }
  }
}
