import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerPromoPublishing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 121.7, 16.8),
              child: SizedBox(
                width: 188.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 9.8, 0, 0),
                      width: 21.9,
                      height: 21.3,
                      child: SizedBox(
                        width: 21.9,
                        height: 21.3,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_106_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 7.2),
                      child: Text(
                        'Промо',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          height: 1,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(36, 0, 26, 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(11, 10, 11, 11),
                  child: Text(
                    'Ваш баланс: 4',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35, 0, 27, 17),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 465,
                  padding: EdgeInsets.fromLTRB(12, 9, 12, 0),
                  child: Text(
                    'Сообщение',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(34, 0, 28, 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(9, 10, 9, 20),
                  child: Text(
                    'Time: HH/MM/DD/MM/YYYY - NOW Autodelete: HH/MM/DD/MM/YYYY',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(34, 0, 28, 13),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4B3832),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 11),
                  child: Text(
                    'Опубликовать',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
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
                          'assets/vectors/vector_26_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_91_x2.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 27,
                      height: 33,
                      child: SvgPicture.asset(
                        'assets/vectors/vector_53_x2.svg',
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
                          'assets/vectors/vector_46_x2.svg',
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
                          'assets/vectors/vector_68_x2.svg',
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
