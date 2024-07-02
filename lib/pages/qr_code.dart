import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
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
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(21, 22, 28.3, 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.3, 0, 0.3),
                      width: 42,
                      height: 32.4,
                      child: SizedBox(
                        width: 42,
                        height: 32.4,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_47_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_80_x2.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 27,
                      height: 33,
                      child: SvgPicture.asset(
                        'assets/vectors/vector_10_x2.svg',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.4, 0, 0.1),
                      width: 30.5,
                      height: 32.5,
                      child: SizedBox(
                        width: 30.5,
                        height: 32.5,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_83_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 1.3, 0, 0.3),
                      width: 31.5,
                      height: 31.5,
                      child: SizedBox(
                        width: 31.5,
                        height: 31.5,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_14_x2.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}