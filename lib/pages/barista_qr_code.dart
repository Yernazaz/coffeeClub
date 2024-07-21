import 'package:flutter/material.dart';
import 'package:flutter_app/pages/barista_info.dart';
import 'package:flutter_app/pages/barista_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRCodeScannerPage(),
      routes: {
        '/coffeeClub': (context) => BaristaInfoPage(),
      },
    );
  }
}

class QRCodeScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Отсканируйте QR-Код'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SansSerif',
                fontSize: 31,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 275,
              height: 275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFECECEC),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/image_18.png', // Add your QR code image in the assets folder and reference it here
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: 320,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Add your scanning functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4B3832),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Отсканировать',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Container(
            height: 50,
            color: Color(0xFFFFF4E6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.qr_code, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodeScannerPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.tune, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BaristaSettingsPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.coffee, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BaristaInfoPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
