import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPromotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Уведомления',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            height: 1,
                            color: const Color(0xFF4B3832),
                          ),
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF4B3832),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.fromLTRB(7, 8, 7, 7),
                          child: Text(
                            'Все',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFFFFF4E6),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.fromLTRB(6.3, 8, 6.3, 7),
                          child: Text(
                            'Акции',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFF4B3832),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
                          child: Text(
                            'Сообщения',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFF4B3832),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
                          child: Text(
                            'Опросы',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFF4B3832),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(31, 0, 31, 9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 8, 13, 6),
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFF000000),
                            ),
                            children: [
                              TextSpan(
                                text: 'Promotion\n', // Added newline character
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Zebra Coffee: On the occasion of Cafe anniversary, we offer 50% discount for your coffee at any member of Coffee club',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(31, 0, 31, 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 8, 13, 1),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Admin Message\n', // Added newline character
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Dear John, On the occasion of your birthday, we offer 50% discount for your coffee at any member of Coffee club',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'received DD/MM ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(31, 0, 31, 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 8, 13, 1),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Admin Message\n', // Added newline character
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Dear John, Thank you for your Order 2953 for 14500 tenge, we will process it soon.',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'received DD/MM ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(31, 0, 31, 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 8, 13, 1),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Admin Message\n', // Added newline character
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Cofe Nova: CAFE NAME offer free donate with every third coffee you buy before may 21, 2024.',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'received DD/MM ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(31, 0, 31, 31),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(13, 8, 13, 1),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Admin Message\n', // Added newline character
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
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 13,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_8_x2.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'received DD/MM ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
