import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_app/pages/barista_info.dart';
import 'package:flutter_app/pages/barista_settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/backend/bonus/barista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRCodeScannerPage(),
    );
  }
}

class QRCodeScannerPage extends StatefulWidget {
  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Color(0xFF4B3832),
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 275,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 100),
              width: 320,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  controller?.resumeCamera();
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
          ),
        ],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      print('--------------------------------------------------------');
      print(scanData.code!);
      print('--------------------------------------------------------');
      String qrCodeId = parseQrCode(scanData.code!);
      String userId = parseUserId(scanData.code!);

      if (qrCodeId.isNotEmpty) {
        try {
          BaristaBonus baristaBonus = BaristaBonus();
          int qrCodeIdInt = int.parse(qrCodeId);
          int userIdIdInt = int.parse(userId);

          await baristaBonus.scanQr(qrCodeIdInt);
          var userDetails = await baristaBonus.getUserDetail(userIdIdInt);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BaristaInfoPage(
                userDetails: userDetails,
                shopId: int.parse(parseShopId(scanData.code!)),
                userId: userIdIdInt,
              ),
            ),
          );
        } catch (e) {
          print('Error: $e');
          controller.resumeCamera();
        }
      }
    });
  }

  String parseQrCode(String scannedText) {
    var params = scannedText.split('&');
    var qrCodeIdParam = params.firstWhere(
        (param) => param.startsWith('QR Code id: '),
        orElse: () => '');
    return qrCodeIdParam.replaceAll('QR Code id: ', '');
  }

  String parseUserId(String scannedText) {
    var params = scannedText.split('&');
    var qrCodeIdParam = params
        .firstWhere((param) => param.startsWith('User id: '), orElse: () => '');
    return qrCodeIdParam.replaceAll('User id: ', '');
  }

  String parseShopId(String scannedText) {
    var params = scannedText.split('&');
    var qrCodeIdParam = params.firstWhere(
        (param) => param.startsWith('CoffeeShop id: '),
        orElse: () => '');
    return qrCodeIdParam.replaceAll('CoffeeShop id: ', '');
  }
}
