
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<Map<String, dynamic>?> login(String username, String password) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    isLoading.value = false;

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}