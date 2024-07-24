import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';
import 'dart:ui' as ui;

class CoffeeMap extends StatefulWidget {
  @override
  _CoffeeMapState createState() => _CoffeeMapState();
}

class _CoffeeMapState extends State<CoffeeMap> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  late LatLng _initialPosition;
  bool _isLoading = true;
  CoffeeShop? _selectedCoffeeShop;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _fetchCoffeeShopCoordinates();
  }

  Future<void> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<Uint8List> _getBytesFromCanvas(String text, Color color) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = color;

    const int width = 200;
    const int height = 100;
    const double circleRadius = 25.0;
    const double textPadding = 10.0;

    // Draw the background for the marker
    canvas.drawCircle(
      const Offset(circleRadius, circleRadius),
      circleRadius,
      paint,
    );

    // Draw the inner white circle
    canvas.drawCircle(
      const Offset(circleRadius, circleRadius),
      circleRadius - 5,
      Paint()..color = Colors.white,
    );

    // Draw text below the circle
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.purple,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: width - 2 * textPadding,
    );

    textPainter.paint(
      canvas,
      Offset(
        circleRadius - textPainter.width / 2,
        circleRadius * 2 + 5,
      ),
    );

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  void _fetchCoffeeShopCoordinates() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<CoffeeShop> coffeeShops = await CoffeeShopsService()
          .fetchCoffeeShops(position.latitude, position.longitude);
      // Debugging: Print the list of coffee shops fetched
      print('Fetched coffee shops: ${coffeeShops.length}');
      coffeeShops.forEach((shop) {
        print('Coffee shop: ${shop.name}, ID: ${shop.id}');
      });

      for (var shop in coffeeShops) {
        final Uint8List markerIcon =
            await _getBytesFromCanvas(shop.name, Colors.purple);
        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(shop.id.toString()),
            position: LatLng(shop.latitude, shop.longitude),
            onTap: () {
              _onMarkerTapped(shop);
            },
            // icon: BitmapDescriptor.fromBytes(markerIcon),
          ));
        });
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load coffee shop coordinates: $e');
    }
  }

  void _onMarkerTapped(CoffeeShop shop) {
    setState(() {
      _selectedCoffeeShop = shop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 10.0,
                  ),
                  markers: _markers,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
          if (_selectedCoffeeShop != null) _buildInfoWindow(),
        ],
      ),
    );
  }

  Widget _buildInfoWindow() {
    return Positioned(
      bottom: 50,
      left: 10,
      right: 10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTV75u3ySWZClZ0gKauKayvQZ6P9ER2cLiIg&s',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 4, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedCoffeeShop!.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text('${_selectedCoffeeShop!.rating} (100 оценок)'),
                    ],
                  ),
                  Text(
                      'Адрес: ${_selectedCoffeeShop!.street}, ${_selectedCoffeeShop!.city}'),
                  const Text('Расстояние: 00 км, 10:00 - 22:00'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ЕСТЬ БОНУСЫ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            height: 1,
                            color: Color(0xFF03AD00)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              // Handle favorite button
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                _selectedCoffeeShop = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
