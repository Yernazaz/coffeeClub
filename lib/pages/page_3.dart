import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(6, 0, 0, 67),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/image_17.png',
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 785,
                padding: EdgeInsets.fromLTRB(25, 30, 32, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: SizedBox(
                    width: double.infinity,
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
                                                    'assets/vectors/vector_94_x2.svg',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_39_x2.svg',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_117_x2.svg',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_114_x2.svg',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_60_x2.svg',
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
                                            'assets/vectors/vector_2_x2.svg',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18.8,
                                        height: 25,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_44_x2.svg',
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
              ),
            ),
            Positioned(
              left: -6,
              right: 0,
              bottom: -67,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: SizedBox(
                  width: 393,
                  height: 91,
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
                              'assets/vectors/vector_89_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_34_x2.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 27,
                          height: 33,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_27_x2.svg',
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
                              'assets/vectors/vector_73_x2.svg',
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
                              'assets/vectors/vector_15_x2.svg',
                            ),
                          ),
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
    );
  }
}