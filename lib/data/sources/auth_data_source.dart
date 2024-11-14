import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthDataSource {
  final String baseUrl;

  AuthDataSource(this.baseUrl);

  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<UserModel?> signup(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: json.encode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
