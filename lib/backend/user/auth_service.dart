import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/backend/utils.dart';

class AuthService {
  Future<void> sendOtp(String phone, [String name = '']) async {
    final url = Uri.parse('$baseUrl/phone/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'phone': phone,
        if (name.isNotEmpty) 'name': name,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send OTP');
    }
  }

  Future<Map<String, String>> login(String phone, String password) async {
    final url = Uri.parse('$baseUrl/login/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'phone': phone,
        'password': password,
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
      String profilePic = data['user_info']['profile_pic'] ??
          'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg';
      await prefs.setString('profile_pic', profilePic);
      return {
        'refresh': data['refresh'],
        'access': data['access'],
      };
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, String>> verifyOtp(
      String phone, String otp, String password) async {
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
      String profilePic = data['user_info']['profile_pic'] ??
          'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg';
      await prefs.setString('profile_pic', profilePic);
      await prefs.setString('profile_pic', profilePic);
      String token = data['access'];
      final url = Uri.parse('$baseUrl/set-password/');
      final response_password = await http.post(
        url,
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'password': password,
          'confirm_password': password,
        }),
      );

      if (response_password.statusCode != 200) {
        throw Exception('Failed to set password');
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('user_password');
        return {
          'refresh': data['refresh'],
          'access': data['access'],
        };
      }
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
