import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class QrCode extends StatelessWidget {
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
                style: GoogleFonts.getFont(
                  'Sanchez',
                  fontWeight: FontWeight.w400,
                  fontSize: 60,
                  height: 1,
                  color: Color(0xFF4B3832),
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 208),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/image_18.png',
                    ),
                  ),
                ),
                child: Container(
                  width: 249,
                  height: 232,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
