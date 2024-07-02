import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 62.9, 1, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(34.9, 0, 34.9, 55.9),
              width: 40.3,
              height: 40.3,
              child: SizedBox(
                width: 40.3,
                height: 40.3,
                child: SvgPicture.asset(
                  'assets/vectors/vector_29_x2.svg',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(29, 0, 29, 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(36.5),
                        ),
                        child: Container(
                          height: 73,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 17, 14, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Алиса',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 8, 7),
                                    child: SizedBox(
                                      width: 193,
                                      child: Text(
                                        '+77777777777',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          height: 1,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Text(
                                      'ред.',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(32, 0, 29, 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 11, 10, 15),
                  child: Text(
                    'Поддержка',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(32, 0, 29, 179),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 11, 10, 15),
                  child: Text(
                    'Настройки',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 29, 9),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 6.4, 11.9, 7.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 6.6, 7, 5.6),
                        child: SizedBox(
                          width: 274.9,
                          child: Text(
                            'Инструменты для владельца кафе',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 29.2,
                        height: 26.2,
                        child: SizedBox(
                          width: 29.2,
                          height: 26.2,
                          child: SvgPicture.asset(
                            'assets/vectors/group_3_x2.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 29, 9),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.3, 10, 15, 12.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 7, 1.5),
                        child: SizedBox(
                          width: 280.7,
                          child: Text(
                            'Инструменты для кафе-бариста',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                        height: 17.5,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_16_x2.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 29, 9),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                  child: Text(
                    'Менеджер кофейни',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 29, 42),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 16),
                  child: Text(
                    'Администратор кофейни',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF000000),
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
              child: SizedBox(
                width: 393,
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
                            'assets/vectors/vector_25_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_115_x2.svg',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 27,
                        height: 33,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_55_x2.svg',
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
                            'assets/vectors/vector_9_x2.svg',
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
                            'assets/vectors/vector_x2.svg',
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
    );
  }
}