import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';

class CoffeeMap extends StatefulWidget {
  @override
  _CoffeeMapState createState() => _CoffeeMapState();
}

class _CoffeeMapState extends State<CoffeeMap> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  LatLng _initialPosition =
      LatLng(78.654605, 108.998618); // Coordinates of "Coffee shop 1"
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoffeeShopCoordinates();
  }

  void _fetchCoffeeShopCoordinates() async {
    try {
      List<CoffeeShop> coffeeShops =
          await CoffeeShopsService().fetchCoffeeShops();
      setState(() {
        coffeeShops.forEach((shop) {
          _markers.add(
            Marker(
              markerId: MarkerId(shop.id.toString()),
              position: LatLng(shop.latitude, shop.longitude),
              infoWindow: InfoWindow(
                title: shop.name,
                snippet: shop.description,
                onTap: () {
                  _showCoffeeShopDetails(shop);
                },
              ),
            ),
          );
        });
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load coffee shop coordinates: $e');
    }
  }

  void _showCoffeeShopDetails(CoffeeShop shop) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(shop.name),
          content: Text(
              'Address: ${shop.street}, ${shop.city}\nRating: ${shop.rating}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 10.0,
              ),
              markers: _markers,
            ),
    );
  }
}
