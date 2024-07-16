import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/notifications_promotions.dart';
import 'package:flutter_app/pages/home_page_widget.dart';
import 'package:flutter_app/pages/settings.dart';
import 'package:flutter_app/pages/best_places.dart';
import 'package:flutter_app/pages/qr_code.dart';
import 'package:flutter_app/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/pages/coffee_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/backend/user/user_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  Future<bool> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    return accessToken != null && accessToken.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data == true) {
            return MaterialApp(
              home: MainPage(), // Navigate to MainPage if logged in
            );
          } else {
            return MaterialApp(
              home: RegisterPage(), // Navigate to RegisterPage if not logged in
            );
          }
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(), // Your existing pages
    QrCode(),
    BestPlaces(),
    NotificationsPromotions(),
    CoffeeMap(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _sendLocationOnLogin() async {
    Position position = await _determinePosition();
    String? token = await getAccessToken();
    if (token != null) {
      UserLocation location =
          UserLocation(lat: position.latitude, lng: position.longitude);
      await sendUserLocation(location, token);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _sendLocationOnLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/vectors/home.svg',
              width: 24,
              height: 24,
            ),
            label:
                'Главное', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/vectors/qrcode.svg',
              width: 24,
              height: 24,
            ),
            label: 'Карта', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/vectors/thunder.svg',
              width: 24,
              height: 24,
            ),
            label:
                'QR Code', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/vectors/bell.svg',
              width: 24,
              height: 24,
            ),
            label:
                'Лучшие кофейни', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/vectors/settings.svg',
              width: 24,
              height: 24,
            ),
            label:
                'Уведомления', // Still provide a label for accessibility purposes
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
