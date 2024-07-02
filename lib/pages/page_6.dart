import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 90),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4B3832),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(34.5, 135, 34.5, 80),
                      child: Text(
                        'Coffee club',
                        style: GoogleFonts.getFont(
                          'Sanchez',
                          fontWeight: FontWeight.w400,
                          fontSize: 60,
                          height: 1,
                          color: Color(0xFFFFF4E6),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 99, 30),
                  child: Text(
                    'Введите SMS код',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      height: 1,
                      color: Color(0xFF4B3832),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 1, 40),
                  child: SizedBox(
                    width: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF4E6),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 32.5, 10, 6.5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFBE9B7B),
                              ),
                              child: Container(
                                width: 20,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF4E6),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 32, 10, 7),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFBE9B7B),
                              ),
                              child: Container(
                                width: 20,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF4E6),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 32, 10, 7),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFBE9B7B),
                              ),
                              child: Container(
                                width: 20,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF4E6),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 32, 10, 7),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFBE9B7B),
                              ),
                              child: Container(
                                width: 20,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(31, 0, 31, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4B3832),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 11, 0, 10),
                      child: Text(
                        'Подтвердить',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          height: 1,
                          color: Color(0xFFFFF4E6),
                          decorationColor: Color(0xFFFFF4E6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 196.5,
            child: SizedBox(
              width: 392.5,
              height: 165.5,
              child: SvgPicture.asset(
                'assets/vectors/rectangle_1481_x2.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}