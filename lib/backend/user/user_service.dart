import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/backend/utils.dart';

class UserLocation {
  final double lat;
  final double lng;

  UserLocation({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}

Future<void> sendUserLocation(UserLocation location, String token) async {
  final url = Uri.parse('$baseUrl/api/user-location/');
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

Future<void> updateUserCall({
  required String name,
  required String phone,
  required String password,
  File? profilePic,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final token = await getToken();
  if (token == null) {
    throw Exception('No access token found');
  }

  var request = http.MultipartRequest(
    'PATCH',
    Uri.parse('$baseUrl/api/user/'),
  );

  request.headers.addAll({
    'accept': 'application/json',
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  });

  request.fields['name'] = name;
  request.fields['phone'] = phone;
  if (password.isNotEmpty) {
    request.fields['password'] = password;
  }

  if (profilePic != null) {
    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_pic',
        profilePic.path,
        filename: basename(profilePic.path),
      ),
    );
  }

  var response = await request.send();
  var responseBody = await response.stream.bytesToString();

  // if (!responseBody.startsWith('{') && !responseBody.startsWith('[')) {
  //   throw Exception('Unexpected response: $responseBody');
  // }

  if (response.statusCode != 200) {
    print('Failed to update user');
    print(response.statusCode);
    print(response.reasonPhrase);
    print(request.fields);
    throw Exception('Failed to update user: ${response.reasonPhrase}');
  } else {
    print(responseBody);
    print('User updated successfully');
    Map<String, dynamic> data = jsonDecode(responseBody);
    String profilePic = data['profile_pic'];
    String user_name = data['name'];
    String user_phone = data['phone'];
    String user_role = data['role'];

    // FIX: Save profile pic to shared preferences
    await prefs.setString('user_name', user_name);
    await prefs.setString('user_phone', user_phone);
    await prefs.setString('user_role', user_role);
    await prefs.setString('profile_pic',
        'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg');
  }
}
