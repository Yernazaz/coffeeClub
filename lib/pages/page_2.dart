import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 6),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Добрый день, Алиса.',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          height: 1,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 7),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 6.3, 0),
                            child: SizedBox(
                              width: 18.8,
                              height: 25,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_110_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 2),
                            child: Text(
                              'Астана',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
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
                    margin: EdgeInsets.fromLTRB(30, 0, 33, 7),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7.4, 6.4, 15.4, 7.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5.5, 0),
                                  width: 21.1,
                                  height: 21.1,
                                  child: SizedBox(
                                    width: 21.1,
                                    height: 21.1,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_105_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 2.6, 0, 3.5),
                                  child: Text(
                                    'Поиск...',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      height: 1,
                                      color: Color(0xFF4B3832),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 4, 0, 3.9),
                              width: 13.2,
                              height: 13.2,
                              child: SizedBox(
                                width: 13.2,
                                height: 13.2,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_62_x2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 34, 15),
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
                                padding: EdgeInsets.fromLTRB(6.3, 8, 6.3, 7),
                                child: Text(
                                  'Рядом',
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
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 7),
                                child: Text(
                                  'С бонусами',
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
                              padding: EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
                              child: Text(
                                'Избранное',
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
                    margin: EdgeInsets.fromLTRB(32, 0, 31, 13),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/image_171.png',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 330,
                                  height: 150,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 14, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: SizedBox(
                                      width: 152,
                                      child: Text(
                                        'Название',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          height: 1,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          child: SizedBox(
                                            width: 91,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_56_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_7_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_24_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_19_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_112_x2.svg',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: Text(
                                            '100 оценок',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 1,
                                              color: Color(0xFF4B3832),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 12, 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Адрес, город, улица.',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 12, 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Расстояние: 00 км, 10:00 - 22:00',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 8.3, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 8, 4),
                                    child: SizedBox(
                                      width: 250,
                                      child: Text(
                                        'ЕСТЬ БОНУСЫ',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          height: 1,
                                          color: Color(0xFF03AD00),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 51.8,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SizedBox(
                                            width: 28,
                                            height: 25,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_118_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18.8,
                                          height: 25,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_66_x2.svg',
                                          ),
                                        ),
                                      ],
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
                    margin: EdgeInsets.fromLTRB(32, 0, 31, 57),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/image_171.png',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 330,
                                  height: 150,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 14, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: SizedBox(
                                      width: 152,
                                      child: Text(
                                        'Название',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          height: 1,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          child: SizedBox(
                                            width: 91,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_31_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_58_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_67_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_18_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_93_x2.svg',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: Text(
                                            '100 оценок',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 1,
                                              color: Color(0xFF4B3832),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 12, 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Адрес, город, улица.',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 12, 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Расстояние: 00 км, 10:00 - 22:00',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1,
                                    color: Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 8.3, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 8, 4),
                                    child: SizedBox(
                                      width: 250,
                                      child: Text(
                                        'ЕСТЬ БОНУСЫ',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          height: 1,
                                          color: Color(0xFF03AD00),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 51.8,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SizedBox(
                                            width: 28,
                                            height: 25,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_54_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18.8,
                                          height: 25,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_96_x2.svg',
                                          ),
                                        ),
                                      ],
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
                                'assets/vectors/vector_13_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_63_x2.svg',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 27,
                            height: 33,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_95_x2.svg',
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
                                'assets/vectors/vector_113_x2.svg',
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
                                'assets/vectors/vector_33_x2.svg',
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
            Positioned(
              right: 31,
              bottom: 122,
              child: Opacity(
                opacity: 0.7,
                child: SizedBox(
                  width: 41,
                  height: 55,
                  child: SvgPicture.asset(
                    'assets/vectors/map_x2.svg',
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