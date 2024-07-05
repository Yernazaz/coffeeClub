import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  LatLng _initialPosition = LatLng(78.654605, 108.998618);
  bool _isLoading = true;
  CoffeeShop? _selectedCoffeeShop;

  @override
  void initState() {
    super.initState();
    _fetchCoffeeShopCoordinates();
  }

  Future<Uint8List> _getBytesFromCanvas(String text) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.purple;

    const int width = 200;
    const int height = 100;
    const double circleRadius = 25.0;
    const double textPadding = 10.0;

    // Draw the background for the marker
    canvas.drawCircle(
      Offset(circleRadius, circleRadius),
      circleRadius,
      paint,
    );

    // Draw the inner white circle
    canvas.drawCircle(
      Offset(circleRadius, circleRadius),
      circleRadius - 5,
      Paint()..color = Colors.white,
    );

    // Draw text below the circle
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
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
      List<CoffeeShop> coffeeShops =
          await CoffeeShopsService().fetchCoffeeShops();

      // Debugging: Print the list of coffee shops fetched
      print('Fetched coffee shops: ${coffeeShops.length}');
      coffeeShops.forEach((shop) {
        print('Coffee shop: ${shop.name}, ID: ${shop.id}');
      });

      for (var shop in coffeeShops) {
        final Uint8List markerIcon = await _getBytesFromCanvas(shop.name);
        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(shop.id.toString()),
            position: LatLng(shop.latitude, shop.longitude),
            onTap: () {
              _onMarkerTapped(shop);
            },
          )
              // icon: BitmapDescriptor.bytes(markerIcon)),
              );
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTV75u3ySWZClZ0gKauKayvQZ6P9ER2cLiIg&s',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedCoffeeShop!.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text('${_selectedCoffeeShop!.rating} (100 оценок)'),
                    ],
                  ),
                  Text(
                      'Адрес: ${_selectedCoffeeShop!.street}, ${_selectedCoffeeShop!.city}'),
                  Text('Расстояние: 00 км, 10:00 - 22:00'),
                  Text(
                    'ЕСТЬ БОНУСЫ',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Handle favorite button
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
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
      ),
    );
  }
}
