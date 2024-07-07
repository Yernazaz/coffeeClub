import 'dart:convert';
import 'package:http/http.dart' as http;

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
        final data = json.decode(response.body);
        return {
          'refresh': data['refresh'],
          'access': data['access'],
        };
      } else {
        throw Exception('Failed to verify OTP');
      }
    
  }
}
