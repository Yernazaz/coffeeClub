import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 90),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4B3832),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 106, 1, 137),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            'Добро пожаловать в',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w800,
                              fontSize: 32,
                              height: 1,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Positioned(
                            bottom: 80,
                            child: SizedBox(
                              height: 60,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(31.2, 0, 30.5, 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: SizedBox(
                          width: 265.3,
                          child: Text(
                            'Регистрация',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                              height: 1,
                              color: Color(0xFF4B3832),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 8, 0, 4),
                        child: Text(
                          'Войти',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            height: 1,
                            color: Color(0xFFBE9B7B),
                            decorationColor: Color(0xFFBE9B7B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(31, 0, 31, 14),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF4E6),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 10, 11, 11),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          'Ваше имя:',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            height: 1,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(31, 0, 31, 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF4E6),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 11, 11, 10),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          'Номер телефона или email: ',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            height: 1,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(31, 0, 31, 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF4E6),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 9, 11, 12),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          'Придумайте пароль: ',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            height: 1,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ),
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
                      padding: EdgeInsets.fromLTRB(0, 11, 1, 10),
                      child: Text(
                        'Получить SMS код',
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
                'assets/vectors/container_x2.svg',
              ),
            ),
          ),
          Positioned(
            right: 39,
            top: 202,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_15.png',
                  ),
                ),
              ),
              child: Container(
                width: 80,
                height: 95,
              ),
            ),
          ),
          Positioned(
            right: 113,
            top: 241,
            child: SizedBox(
              width: 11,
              height: 12,
              child: SvgPicture.asset(
                'assets/vectors/star_11_x2.svg',
              ),
            ),
          ),
          Positioned(
            right: 42,
            top: 192,
            child: SizedBox(
              width: 14,
              height: 15,
              child: SvgPicture.asset(
                'assets/vectors/star_2_x2.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
