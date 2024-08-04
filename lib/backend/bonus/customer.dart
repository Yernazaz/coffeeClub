import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/backend/utils.dart';

class CustomerBonus {
  Future<Map<String, dynamic>> generateQr(int id) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/bonuse/customer/generate-qr/$id/'),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print(response.body);
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> refreshQr(int id) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/bonuse/customer/refresh-qr/$id/'),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> viewBonusGlasses(
      int userId, int coffeeShopId) async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse(
          '$baseUrl/bonuse/customer/view-bonus-glasses/$userId/$coffeeShopId/'),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
