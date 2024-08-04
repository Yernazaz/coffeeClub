import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://coffee-club-e65fb60d8d11.herokuapp.com';

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('access') ?? '';
}
