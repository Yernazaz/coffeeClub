import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class QrCode1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                    margin: EdgeInsets.fromLTRB(32, 0, 31, 141),
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
                                                      'assets/vectors/vector_38_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_77_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_71_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                  child: SizedBox(
                                                    width: 15,
                                                    height: 15,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_23_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_86_x2.svg',
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
                                              'assets/vectors/vector_57_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18.8,
                                          height: 25,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_43_x2.svg',
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(127, 0, 0, 120),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '9',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(29, 0, 29, 116),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: 320,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(14, 6, 6, 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 9, 30, 0),
                                    child: SizedBox(
                                      width: 256,
                                      child: Text(
                                        'При покупке кофе необходимо показать кассиру QR-код. Чтобы получить 10-ю чашку кофе бесплатно, нужно собрать 9 штампов за предыдущие покупки. ',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          height: 1,
                                          color: Color(0xFF4B3832),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 54),
                                    child: SizedBox(
                                      width: 14,
                                      height: 15,
                                      child: SvgPicture.asset(
                                        'assets/vectors/star_3_x2.svg',
                                      ),
                                    ),
                                  ),
                                ],
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
                                    'assets/vectors/vector_20_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                child: SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_28_x2.svg',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 27,
                                height: 33,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_52_x2.svg',
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
                                    'assets/vectors/vector_78_x2.svg',
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
                                    'assets/vectors/vector_122_x2.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 308,
              child: SizedBox(
                width: 302.9,
                height: 221,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(21, 0, 23.9, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                            child: SizedBox(
                              width: 57,
                              child: Text(
                                '1',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1,
                                  color: Color(0xFF4B3832),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '2',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                          Text(
                            '3',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                          Text(
                            '4',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                          Text(
                            '5',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2.9, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 48,
                            height: 71,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_100_x2.svg',
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 71,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_107_x2.svg',
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 71,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_82_x2.svg',
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 71,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_70_x2.svg',
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 71,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_121_x2.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(2.2, 0, 6.1, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 6, 1),
                            child: SizedBox(
                              width: 57,
                              child: Text(
                                '01.01.24',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1,
                                  color: Color(0xFF4B3832),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            child: Text(
                              '01.01.24',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              '01.01.24',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              '01.01.24',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              '01.01.24',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(21, 0, 20.9, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 6, 1),
                            child: SizedBox(
                              width: 57,
                              child: Text(
                                '6',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1,
                                  color: Color(0xFF4B3832),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                            child: Text(
                              '7',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              '8',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              '10',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2.9, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              width: 48,
                              height: 71,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_65_x2.svg',
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              width: 48,
                              height: 71,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_120_x2.svg',
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              width: 48,
                              height: 71,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_36_x2.svg',
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              width: 48,
                              height: 71,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_22_x2.svg',
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              width: 48,
                              height: 71,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_85_x2.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Бесплатно',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1,
                        color: Color(0xFF4B3832),
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