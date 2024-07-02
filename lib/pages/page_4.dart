import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -6,
            top: -29,
            child: SizedBox(
              width: 396,
              height: 852,
              child: SvgPicture.asset(
                'assets/vectors/image_splash_x2.svg',
              ),
            ),
          ),
    Container(
            padding: EdgeInsets.fromLTRB(2, 29, 3, 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25.2, 0, 25.2, 366),
                  child: Text(
                    'Пропустить',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 0, 341.6),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'splash screen 1, 2, 3, 4, 5, 6,  SWIPE',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w500,
                        fontSize: 31,
                        height: 1,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(17.9, 0, 15.9, 12.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 12.1,
                        height: 18.8,
                        child: SizedBox(
                          width: 12.1,
                          height: 18.8,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_116_x2.svg',
                          ),
                        ),
                      ),
                      Container(
                        width: 12.1,
                        height: 18.8,
                        child: SizedBox(
                          width: 12.1,
                          height: 18.8,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_6_x2.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x66F5F5F5),
                          ),
                          child: Container(
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x66F5F5F5),
                        ),
                        child: Container(
                          height: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}