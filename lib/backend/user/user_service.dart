import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLocation {
  final double lat;
  final double lng;

  UserLocation({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}

Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}

Future<void> sendUserLocation(UserLocation location, String token) async {
  final url = Uri.parse(
      'https://coffee-club-e65fb60d8d11.herokuapp.com/api/user-location/');
  final headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json'
  };
  final body = jsonEncode(location.toJson());

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('Location sent successfully');
  } else {
    print('Failed to send location: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
