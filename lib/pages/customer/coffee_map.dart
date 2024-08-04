import 'dart:typed_data';
import 'package:flutter/material.dart';
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
  final Map<String, Uint8List> _cachedIcons = {};

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    await _determinePosition();
    await _fetchCoffeeShopCoordinates();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (mounted) {
      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
      });
    }
  }

  Future<Uint8List> _getBytesFromCanvas(String text, Color color) async {
    if (_cachedIcons.containsKey(text)) {
      return _cachedIcons[text]!;
    }

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = color;

    const int width = 100;
    const int height = 100;
    const double circleRadius = 25.0;

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

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    final uint8List = data!.buffer.asUint8List();

    _cachedIcons[text] = uint8List;
    return uint8List;
  }

  Future<void> _fetchCoffeeShopCoordinates() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<CoffeeShop> coffeeShops = await CoffeeShopsService()
          .fetchCoffeeShops(position.latitude, position.longitude);

      print('Fetched coffee shops: ${coffeeShops.length}');
      for (var shop in coffeeShops) {
        print('Coffee shop: ${shop.name}, ID: ${shop.id}');
        final Uint8List markerIcon =
            await _getBytesFromCanvas(shop.name, Colors.purple);
        if (mounted) {
          setState(() {
            _markers.add(Marker(
              markerId: MarkerId(shop.id.toString()),
              position: LatLng(shop.latitude, shop.longitude),
              onTap: () {
                _onMarkerTapped(shop);
              },
              icon: BitmapDescriptor.fromBytes(markerIcon),
              anchor: const Offset(0.5, 0.5),
            ));
          });
        }
      }
    } catch (e) {
      print('Failed to load coffee shop coordinates: $e');
    }
  }

  void _onMarkerTapped(CoffeeShop shop) {
    setState(() {
      _selectedCoffeeShop = shop;
    });
    _showBottomSheet();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _buildInfoWindow();
      },
    );
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
                    zoom: 16.0,
                  ),
                  markers: _markers,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
        ],
      ),
    );
  }

  Widget _buildInfoWindow() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              'https://www.coffeebeancompany.co.uk/app/uploads/2017/04/Coffee-Shop-1024x765.jpg',
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
                Text(
                    'Расстояние: ${_selectedCoffeeShop!.distance}, ${_selectedCoffeeShop!.openingHours} - 22:00'),
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
                            Navigator.pop(context);
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
    );
  }
}
