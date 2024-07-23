import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/api';

  Future<void> sendOtp(String phone, String name) async {
    final url = Uri.parse('$baseUrl/phone/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'phone': phone,
        'name': name,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send OTP');
    }
  }

  Future<Map<String, String>> verifyOtp(String phone, String otp) async {
    final url = Uri.parse('$baseUrl/otp/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'phone': phone,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      // Save user info to Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('refresh', data['refresh']);
      await prefs.setString('access', data['access']);
      await prefs.setInt('user_id', data['user_id']);
      await prefs.setString('user_name', data['user_info']['name']);
      await prefs.setString('user_phone', data['user_info']['phone']);
      await prefs.setString('user_role', data['user_info']['role']);

      return {
        'refresh': data['refresh'],
        'access': data['access'],
      };
    } else {
      throw Exception('Failed to verify OTP');
    }
  }

  Future<String> refreshToken(String refreshToken) async {
    final url = Uri.parse('$baseUrl/refresh-token/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: json.encode({
        'refresh': refreshToken,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      // Update the access token in Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access', data['access']);

      return data['access'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh');
    await prefs.remove('access');
    await prefs.remove('user_id');
    await prefs.remove('user_name');
    await prefs.remove('user_phone');
    await prefs.remove('user_role');
  }
}
