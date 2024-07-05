import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPromotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      'Уведомления',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        height: 1,
                        color: Color(0xFF4B3832),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF4B3832),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(7, 8, 7, 7),
                                child: Text(
                                  'Все',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1,
                                    color: Color(0xFFFFF4E6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFECECEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(7.4, 8, 7.4, 7),
                                child: Text(
                                  'Акции',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFECECEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 8, 11, 7),
                                child: Text(
                                  'Сообщения',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFECECEC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 8, 1, 7),
                              child: Text(
                                'Опросы',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF4B3832),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 23.6, 7),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'Promotion',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Cofe Nova:CAFE NAME offer free donate with every third coffee you buy before may 21, 2024.',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(31, 0, 31, 9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 4, 27.7, 3),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'Promotion',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Zebra Coffee:On the occasion of Cafe anniversary, we offer 50% discount for your coffee at any member of Coffee club',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(31, 0, 31, 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 8, 30.8, 1),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Admin Message',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Dear John,On the occasion of your birthday, we offer 50% discount for your coffee at any member of Coffee club',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -18.3,
                              bottom: 5,
                              child: SizedBox(
                                height: 13,
                                child: Text(
                                  'received DD/MM ',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    height: 1,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(31, 0, 31, 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 17, 24.8, 12),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Admin Message',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Dear John,Thank you for your Order 2953 for 14500 tenge, we will process it soon.  ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -12.3,
                              bottom: -2,
                              child: SizedBox(
                                height: 13,
                                child: Text(
                                  'received DD/MM ',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    height: 1,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(31, 0, 31, 31),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 17, 13.4, 12),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Admin Message',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Dear John, You have been issued payment Request for Order 2953. Your order will be cancelled in 2 days, if no payment received. Please press this button to confirm payment. Thank you! ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -0.8,
                              bottom: -6,
                              child: SizedBox(
                                height: 13,
                                child: Text(
                                  'received DD/MM ',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    height: 1,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 2.6,
                              bottom: 18,
                              child: SizedBox(
                                width: 25,
                                height: 13,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_8_x2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 31,
              right: 31,
              top: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 331,
                  height: 77,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
