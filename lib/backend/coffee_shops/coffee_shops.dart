import 'dart:convert';
import 'package:http/http.dart' as http;

class CoffeeShop {
  final int id;
  final String name;
  final String street;
  final String city;
  final String region;
  final String phoneNumber;
  final String email;
  final String website;
  final String openingHours;
  final double rating;
  final bool food;
  final bool wifi;
  final bool drinks;
  final bool seating;
  final bool powerOutlets;
  final double latitude;
  final double longitude;
  final String description;

  CoffeeShop({
    required this.id,
    required this.name,
    required this.street,
    required this.city,
    required this.region,
    required this.phoneNumber,
    required this.email,
    required this.website,
    required this.openingHours,
    required this.rating,
    required this.food,
    required this.wifi,
    required this.drinks,
    required this.seating,
    required this.powerOutlets,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory CoffeeShop.fromJson(Map<String, dynamic> json) {
    return CoffeeShop(
      id: json['id'],
      name: json['name'],
      street: json['street'],
      city: json['city'],
      region: json['region'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      website: json['website'],
      openingHours: json['opening_hours'],
      rating: double.parse(json['rating']),
      food: json['amenities']['food'],
      wifi: json['amenities']['wifi'],
      drinks: json['amenities']['drinks'],
      seating: json['amenities']['seating'],
      powerOutlets: json['amenities']['power_outlets'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      description: json['description'],
    );
  }
}

class CoffeeShopsService {
  static const String apiUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/list-coffee-shops/';
  static const String coordinatesUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/coffee-shops/coordinates/';

  Future<List<CoffeeShop>> fetchCoffeeShops() async {
    final response = await http
        .get(Uri.parse(apiUrl), headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((shop) => CoffeeShop.fromJson(shop)).toList();
    } else {
      throw Exception('Failed to load coffee shops');
    }
  }

  Future<List<CoffeeShop>> fetchCoffeeShopCoordinates() async {
    final response = await http.get(Uri.parse(coordinatesUrl),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((coord) => CoffeeShop.fromJson(coord)).toList();
    } else {
      throw Exception('Failed to load coffee shop coordinates');
    }
  }
}
