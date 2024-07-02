import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/notifications_promotions.dart';
import 'package:flutter_app/pages/owner_promo_publishing.dart';
import 'package:flutter_app/pages/owner_subscription_management.dart';
import 'package:flutter_app/pages/owner_tools.dart';
import 'package:flutter_app/pages/page.dart';
import 'package:flutter_app/pages/page_1.dart';
import 'package:flutter_app/pages/page_2.dart';
import 'package:flutter_app/pages/page_3.dart';
import 'package:flutter_app/pages/page_4.dart';
import 'package:flutter_app/pages/page_5.dart';
import 'package:flutter_app/pages/page_6.dart';
import 'package:flutter_app/pages/qr_code.dart';
import 'package:flutter_app/pages/qr_code_1.dart';
import 'package:flutter_app/pages/settings.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      home: Scaffold(
        // body: NotificationsPromotions(),
        // body: OwnerPromoPublishing(),
        // body: OwnerSubscriptionManagement(),
        // body: OwnerTools(),
        // body: Page(),
        body: RegisterPage(),
        // body: Page2(),
        // body: Page3(),
        // body: Page4(),
        // body: Page5(),
        // body: Page6(),
        // body: QrCode(),
        // body: QrCode1(),
        // body: Settings(),
      ),
    );
  }
}
