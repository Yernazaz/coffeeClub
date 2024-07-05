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
    return accessToken != '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:
                'Главное', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Карта', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_zip),
            label:
                'QR Code', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label:
                'Лучшие кофейни', // Still provide a label for accessibility purposes
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
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
