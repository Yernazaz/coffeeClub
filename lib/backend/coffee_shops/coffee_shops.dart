import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  final List<MenuItem> menuItems;
  final String distance;

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
    required this.menuItems,
    required this.distance,
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
      menuItems: (json['menu_items'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
      distance: json['distance'],
    );
  }
}

class Amenities {
  final bool food;
  final bool wifi;
  final bool drinks;
  final bool seating;
  final bool powerOutlets;

  Amenities({
    required this.food,
    required this.wifi,
    required this.drinks,
    required this.seating,
    required this.powerOutlets,
  });

  factory Amenities.fromJson(Map<String, dynamic> json) {
    return Amenities(
      food: json['food'],
      wifi: json['wifi'],
      drinks: json['drinks'],
      seating: json['seating'],
      powerOutlets: json['power_outlets'],
    );
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
    );
  }
}

class CoffeeShopsService {
  static const String apiUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/list-coffee-shops/';
  static const String coordinatesUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/coffee-shops/coordinates/';

  Future<List<CoffeeShop>> fetchCoffeeShops(
      double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if cache exists
    String? cachedData = prefs.getString('coffeeShopsCache');
    if (cachedData != null) {
      List jsonResponse = json.decode(cachedData);
      return jsonResponse.map((shop) => CoffeeShop.fromJson(shop)).toList();
    }

    // Fetch data from the API if cache does not exist
    final response = await http.get(
        Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      prefs.setString(
          'coffeeShopsCache', json.encode(jsonResponse)); // Cache the response
      return jsonResponse.map((shop) => CoffeeShop.fromJson(shop)).toList();
    } else {
      throw Exception('Failed to load coffee shops');
    }
  }

  Future<List<CoffeeShop>> fetchCoffeeShopCoordinates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if cache exists
    String? cachedData = prefs.getString('coffeeShopsCoordinatesCache');
    if (cachedData != null) {
      List jsonResponse = json.decode(cachedData);
      return jsonResponse.map((coord) => CoffeeShop.fromJson(coord)).toList();
    }

    // Fetch data from the API if cache does not exist
    final response = await http.get(Uri.parse(coordinatesUrl),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      prefs.setString('coffeeShopsCoordinatesCache',
          json.encode(jsonResponse)); // Cache the response
      return jsonResponse.map((coord) => CoffeeShop.fromJson(coord)).toList();
    } else {
      throw Exception('Failed to load coffee shop coordinates');
    }
  }

  Future<void> updateCoffeeShopsCache(double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      prefs.setString(
          'coffeeShopsCache', json.encode(jsonResponse)); // Update the cache
    } else {
      throw Exception('Failed to update coffee shops cache');
    }
  }
}
