import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/notifications_promotions.dart';
import 'package:flutter_app/pages/owner_promo_publishing.dart';
import 'package:flutter_app/pages/owner_subscription_management.dart';
import 'package:flutter_app/pages/owner_tools.dart';
import 'package:flutter_app/pages/page.dart';
import 'package:flutter_app/pages/register_page.dart';
import 'package:flutter_app/pages/page_2.dart';
import 'package:flutter_app/pages/page_3.dart';
import 'package:flutter_app/pages/page_4.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/sms_verification_page.dart';
import 'package:flutter_app/pages/qr_code.dart';
import 'package:flutter_app/pages/qr_code_1.dart';
import 'package:flutter_app/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return accessToken != null;
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
              home: Page2(), // Adjust this to your logged-in home page
            );
          } else {
            return MaterialApp(
              home: RegisterPage(),
            );
          }
        }
      },
    );
  }
}
