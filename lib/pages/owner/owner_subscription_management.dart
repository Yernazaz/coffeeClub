import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerSubscriptionManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(7, 60, 7, 44),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 68.2, 49.8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 205.1,
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
                                'assets/vectors/vector_11_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7.2),
                            child: Text(
                              'Подписки',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w800,
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
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(29.6, 0, 0, 68),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 0, 9),
                        child: Text(
                          'ВЫБЕРИТЕ СЕБЕ ПОДПИСКУ',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            height: 1.3,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Text(
                        'Начните с 14-дневного бесплатного профессионального курса. Обновите или понизьте версию в любое время.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(13, 121, 13, 0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -119,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: SizedBox(
                              width: 267,
                              height: 459,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 13.1, 34.1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_17_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_20_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_23_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_15_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_18_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.2),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_24_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_2_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 18.7,
                                      height: 18.7,
                                      child: SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_6_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '1 promotion',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1,
                              color: Color(0xFF000000),
                            ),
                            children: [
                              TextSpan(
                                text: '0 item menue',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0x80000000),
                                ),
                              ),
                              TextSpan(
                                text: '',
                              ),
                              TextSpan(
                                text: 'Social media and 2gis ',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0x80000000),
                                ),
                              ),
                              TextSpan(
                                text: '',
                              ),
                              TextSpan(
                                text: '',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0x80000000),
                                ),
                              ),
                              TextSpan(
                                text: '',
                              ),
                              TextSpan(
                                text: 'Analytics +  ',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0x80000000),
                                ),
                              ),
                              TextSpan(
                                text: '',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -121,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFE2B68),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                              ),
                            ),
                            child: Container(
                              width: 267,
                              height: 93,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: -1,
              bottom: 74,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: SizedBox(
                  width: 240,
                  height: 459,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 18.1, 33.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_9_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_8_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_4_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_29_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_16_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_14_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.2),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_11_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_10_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_28_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          width: 18.7,
                          height: 18.7,
                          child: SizedBox(
                            width: 18.7,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/group_25_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 54.1,
              bottom: 29,
              child: SizedBox(
                height: 384,
                child: Text(
                  '3 promotions ',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -1,
              top: 213,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFADFE8A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                ),
                child: Container(
                  width: 282,
                  height: 93,
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 282,
                  height: 522,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(19.1, 34, 19.1, 20),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: -19.1,
                          right: -19.1,
                          top: -34,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF8C78FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                              ),
                            ),
                            child: Container(
                              width: 282,
                              height: 93,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 214.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 24, 7.1),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 1, 1.4, 0),
                                        child: RichText(
                                          text: TextSpan(
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              height: 1,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Т15',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 48,
                                                  height: 1.3,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 24,
                                                  height: 1,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 28),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'тыс.',
                                            style: GoogleFonts.getFont(
                                              'Roboto Condensed',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              height: 1,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '/в месяц',
                                                style: GoogleFonts.getFont(
                                                  'Roboto Condensed',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10,
                                                  height: 1.3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_26_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(1, 0, 1, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_32_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_27_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_13_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_19_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_1_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_22_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 13.3),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_31_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 12.4),
                                child: SizedBox(
                                  width: 18.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 14.1),
                                        child: SizedBox(
                                          width: 18.7,
                                          height: 18.7,
                                          child: SvgPicture.asset(
                                            'assets/vectors/group_7_x2.svg',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18.7,
                                        height: 18.7,
                                        child: SvgPicture.asset(
                                          'assets/vectors/group_12_x2.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 17.1),
                                width: 18.7,
                                height: 18.7,
                                child: SizedBox(
                                  width: 18.7,
                                  height: 18.7,
                                  child: SvgPicture.asset(
                                    'assets/vectors/group_21_x2.svg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8C78FF),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    width: 185,
                                    padding: EdgeInsets.fromLTRB(1, 11, 0, 13),
                                    child: Text(
                                      'Get Started',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 112,
              top: 159,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF06AC98),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Container(
                  width: 150,
                  height: 46,
                  padding: EdgeInsets.fromLTRB(0, 7, 4.8, 7),
                  child: Text(
                    'PRO',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      height: 1,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 71,
              bottom: 40,
              child: SizedBox(
                height: 421,
                child: RichText(
                  text: TextSpan(
                    text: '3 promotions ',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                      color: Color(0xFF000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Analytics +  ',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.3,
                          color: Color(0x80000000),
                        ),
                      ),
                      TextSpan(
                        text: '',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
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
            Positioned(
              left: -7,
              right: -7,
              bottom: -44,
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
                              'assets/vectors/vector_4_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_45_x2.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 27,
                          height: 33,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_99_x2.svg',
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
                              'assets/vectors/vector_97_x2.svg',
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
                              'assets/vectors/vector_59_x2.svg',
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
