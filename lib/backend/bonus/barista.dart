import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaristaBonus {
  static const String baseUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com';

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<Map<String, dynamic>> giveBonus(int userId, int coffeeShopId) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/bonuse/barista/give-bonus/$userId/$coffeeShopId/'),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
      body: '', // Empty body
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to give bonus');
    }
  }

  Future<Map<String, dynamic>> scanQr(int qrId) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/bonuse/barista/scan-qr/$qrId/'),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
      body: '', // Empty body
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to scan QR code');
    }
  }
}
