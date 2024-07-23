import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/bonus/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCode extends StatefulWidget {
  final int id;

  QrCode({required this.id});

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  String? qrCode;
  DateTime? validTill;

  @override
  void initState() {
    super.initState();
    _loadQrCode();
  }

  Future<void> _loadQrCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? qrCodeData = prefs.getString('qr_code_data');
    if (qrCodeData != null) {
      Map<String, dynamic> qrCodeMap = jsonDecode(qrCodeData);
      setState(() {
        qrCode = qrCodeMap['qr_code'];
        validTill = DateTime.parse(qrCodeMap['valid_till']);
      });

      if (DateTime.now().isAfter(validTill!)) {
        _refreshQrCode();
      } else {
        _setRefreshTimer();
      }
    } else {
      _generateQrCode();
    }
  }

  Future<void> _generateQrCode() async {
    try {
      CustomerBonus customerBonus = CustomerBonus();
      Map<String, dynamic> qrData = await customerBonus.generateQr(widget.id);
      setState(() {
        qrCode = qrData['qr_code'];
        validTill = DateTime.parse(qrData['valid_till']);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('qr_code_data', jsonEncode(qrData));

      _setRefreshTimer();
    } catch (e) {
      print('Error generating QR code: $e');
    }
  }

  Future<void> _refreshQrCode() async {
    try {
      CustomerBonus customerBonus = CustomerBonus();
      Map<String, dynamic> qrData = await customerBonus.refreshQr(widget.id);
      setState(() {
        qrCode = qrData['qr_code'];
        validTill = DateTime.parse(qrData['valid_till']);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('qr_code_data', jsonEncode(qrData));

      _setRefreshTimer();
    } catch (e) {
      print('Error refreshing QR code: $e');
    }
  }

  void _setRefreshTimer() {
    Duration duration = validTill!.difference(DateTime.now());
    Future.delayed(duration, () {
      _refreshQrCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 123, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(34.5, 0, 34.5, 30),
              child: Text(
                'Coffee club',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Sanchez',
                  fontWeight: FontWeight.w400,
                  fontSize: 56,
                  height: 1,
                  color: Color(0xFF4B3832),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 0, 46),
              child: Text(
                'ПОКАЖИТЕ ЭТОТ QR-КОД НА КАССЕ',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w700,
                  fontSize: 31,
                  height: 1,
                  color: Color(0xFF4B3832),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            if (qrCode != null)
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 208),
                child: Image.memory(
                  base64Decode(qrCode!.split(',')[1]),
                  width: 300,
                  height: 300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
