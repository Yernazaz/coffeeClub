import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logging/logging.dart';

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
      rating: double.parse(json['rating'].toString()),
      food: json['amenities']['food'],
      wifi: json['amenities']['wifi'],
      drinks: json['amenities']['drinks'],
      seating: json['amenities']['seating'],
      powerOutlets: json['amenities']['power_outlets'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      description: json['description'],
      menuItems: (json['menu_items'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList(),
      distance: json['distance'],
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
      price: double.parse(json['price'].toString()),
    );
  }
}

class CoffeeShopsService {
  static const String apiUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/list-coffee-shops/';
  static const String coordinatesUrl =
      'https://coffee-club-e65fb60d8d11.herokuapp.com/coffeeshops/coffee-shops/coordinates/';

  final CacheManager cacheManager = DefaultCacheManager();
  final Logger logger = Logger('CoffeeShopsService');

  CoffeeShopsService() {
    _setupLogging();
  }

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<List<CoffeeShop>> fetchCoffeeShops(
      double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime startTime, endTime;
    startTime = DateTime.now();

    // Check if cache exists
    FileInfo? cachedFile =
        await cacheManager.getFileFromCache('coffeeShopsCache');
    if (cachedFile != null) {
      logger.info('Getting list from cache');
      String fileContent = await cachedFile.file.readAsString();
      Map<String, dynamic> jsonResponse = json.decode(fileContent);
      List<dynamic> results = jsonResponse['results'];
      List<CoffeeShop> coffeeShops =
          results.map((shop) => CoffeeShop.fromJson(shop)).toList();

      // Fetch data from API in parallel
      fetchAndUpdateCoffeeShops(latitude, longitude);
      endTime = DateTime.now();
      logger.info(
          'Cache fetch time: ${endTime.difference(startTime).inMilliseconds} ms');

      return coffeeShops;
    }

    // Fetch data from the API if cache does not exist
    startTime = DateTime.now();
    final response = await http.get(
        Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'),
        headers: {'accept': 'application/json'});
    endTime = DateTime.now();

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> results = jsonResponse['results'];
      await cacheManager.putFile(
        'coffeeShopsCache',
        response.bodyBytes,
        fileExtension: 'json',
      ); // Cache the response
      logger.info(
          'API fetch time: ${endTime.difference(startTime).inMilliseconds} ms');
      return results.map((shop) => CoffeeShop.fromJson(shop)).toList();
    } else {
      throw Exception('Failed to load coffee shops');
    }
  }

  Future<void> fetchAndUpdateCoffeeShops(
      double latitude, double longitude) async {
    final response = await http.get(
        Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> results = jsonResponse['results'];
      await cacheManager.putFile(
        'coffeeShopsCache',
        response.bodyBytes,
        fileExtension: 'json',
      ); // Update the cache

      // Rebuild the UI with the updated data if needed
      // Implement a callback or a state management solution to update the UI
    } else {
      throw Exception('Failed to update coffee shops cache');
    }
  }

  Future<void> updateCoffeeShopsCache(double latitude, double longitude) async {
    final response = await http.get(
        Uri.parse('$apiUrl?latitude=$latitude&longitude=$longitude'),
        headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> results = jsonResponse['results'];
      await cacheManager.putFile(
        'coffeeShopsCache',
        response.bodyBytes,
        fileExtension: 'json',
      ); // Update the cache
    } else {
      throw Exception('Failed to update coffee shops cache');
    }
  }
}
