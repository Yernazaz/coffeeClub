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
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';
import 'package:flutter_app/pages/coffee_shop.dart';
import 'package:flutter_app/pages/barista_qr_code.dart';

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
  Future<String?> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshTokenPref = prefs.getString('refresh');
    if (refreshTokenPref == null || refreshTokenPref.isEmpty) {
      return null;
    }
    AuthService authService = AuthService();
    try {
      await authService.refreshToken(refreshTokenPref);
    } catch (e) {
      return null;
    }
    String? accessToken = prefs.getString('access');
    String? userRole = prefs.getString('user_role');
    if (accessToken != null && accessToken.isNotEmpty) {
      return userRole;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: checkLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.data != null) {
          return MaterialApp(
            home: MainPage(
                userRole: snapshot.data!), // Navigate to MainPage if logged in
          );
        } else {
          return MaterialApp(
            home: RegisterPage(), // Navigate to RegisterPage if not logged in
          );
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  final String userRole;
  MainPage({required this.userRole});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _customerOptions = <Widget>[
    HomePageWidget(), // Your existing pages
    BestPlaces(),
    // NotificationsPromotions(),
    CoffeeMap(),
    SettingsPage(),
  ];

  static final List<Widget> _baristaOptions = <Widget>[
    QRCodeScannerPage(), // Barista's page
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
    final isCustomer = widget.userRole == 'customer';
    final widgetOptions = isCustomer ? _customerOptions : _baristaOptions;

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: isCustomer
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/home.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Главное',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/thunder.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Best Places',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/MAP.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/settings.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            )
          : null,
    );
  }
}
