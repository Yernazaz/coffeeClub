import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFF4E6),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 56, 51),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 9.8, 35.1, 16.8),
                      width: 21.9,
                      height: 21.3,
                      child: SizedBox(
                        width: 21.9,
                        height: 21.3,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_35_x2.svg',
                        ),
                      ),
                    ),
                    Text(
                      'Инструменты для владельца кафе',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        height: 1,
                        color: Color(0xFF4B3832),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 19.4, 12.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 25,
                    height: 22.2,
                    child: SvgPicture.asset(
                      'assets/vectors/vector_79_x2.svg',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 1.2),
                    child: RichText(
                      text: TextSpan(
                        text: 'Подписка: ',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'Стандарт, Про, Элит (до ДД/ММ/ГГ)',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 13.8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                      child: SizedBox(
                        width: 25,
                        height: 22.2,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_88_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 1.2),
                      child: Text(
                        'Лимит публикации промо: 7',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9.5),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0.5),
                      width: 25,
                      height: 20,
                      child: SizedBox(
                        width: 25,
                        height: 20,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_17_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 4.5, 0, 0),
                      child: Text(
                        'Лимит публикации Splash: 3',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(26, 0, 26, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 13, 7.8),
                      child: SizedBox(
                        width: 25,
                        height: 22.2,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_76_x2.svg',
                        ),
                      ),
                    ),
                    Text(
                      'Купить дополнительную акцию/заставку/топ-место',
                      style: GoogleFonts.getFont(
                        'Inter',
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 12.5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                      child: SizedBox(
                        width: 25,
                        height: 23.5,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_49_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 2.5),
                      child: Text(
                        'Рассчитать аналитику',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(27, 0, 27, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15.1, 0),
                      child: SizedBox(
                        width: 21.9,
                        height: 25,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_90_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: Text(
                        'Аналитика +  ',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 24, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 1),
                      child: SizedBox(
                        width: 25,
                        height: 20,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_109_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        'Управление деталями филиала',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 24, 13.8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                      child: SizedBox(
                        width: 25,
                        height: 22.2,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_72_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 1.2),
                      child: Text(
                        'Полученные сообщения',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 14.1),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 16.1, 0),
                      child: SizedBox(
                        width: 21.9,
                        height: 21.9,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_32_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0.9),
                      child: Text(
                        'QR Сканер',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4B3832),
                  ),
                  child: Container(
                    width: 393,
                    height: 1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(27, 0, 27, 150.1),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 14.1, 0),
                      child: SizedBox(
                        width: 21.9,
                        height: 21.9,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_42_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 1.9),
                      child: Text(
                        'Опрос для клиентов ',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
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
                              'assets/vectors/vector_3_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_123_x2.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 27,
                          height: 33,
                          child: SvgPicture.asset(
                            'assets/vectors/vector_75_x2.svg',
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
                              'assets/vectors/vector_50_x2.svg',
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
                              'assets/vectors/vector_102_x2.svg',
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
