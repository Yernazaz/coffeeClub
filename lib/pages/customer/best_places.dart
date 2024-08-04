import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class BestPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF4E6),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 43),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Лучшие заведения',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      height: 1,
                      color: const Color(0xFF4B3832),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 13),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(11),
                                  topRight: Radius.circular(11)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTV75u3ySWZClZ0gKauKayvQZ6P9ER2cLiIg&s'),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 14, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: SizedBox(
                                  width: 152,
                                  child: Text(
                                    'Название',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 2, 0, 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: SizedBox(
                                        width: 91,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_84_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_69_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_74_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_81_x2.svg',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_92_x2.svg',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        '100 оценок',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          height: 1,
                                          color: const Color(0xFF4B3832),
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
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Адрес, город, улица.',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Расстояние: 00 км, 10:00 - 22:00',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 8, 4),
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'ЕСТЬ БОНУСЫ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      height: 1,
                                      color: const Color(0xFF03AD00),
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 25,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_103_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.8,
                                      height: 25,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_64_x2.svg',
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
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 42),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(11),
                                  topRight: Radius.circular(11)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.coffeebeancompany.co.uk/app/uploads/2017/04/Coffee-Shop-1024x765.jpg'),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 14, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: SizedBox(
                                  width: 152,
                                  child: Text(
                                    'Название',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 2, 0, 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                      child: SizedBox(
                                        width: 91,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_98_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_101_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_51_x2.svg',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/vector_48_x2.svg',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_87_x2.svg',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        '100 оценок',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          height: 1,
                                          color: const Color(0xFF4B3832),
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
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Адрес, город, улица.',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Расстояние: 00 км, 10:00 - 22:00',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 8, 4),
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'ЕСТЬ БОНУСЫ',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      height: 1,
                                      color: const Color(0xFF03AD00),
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 25,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_41_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.8,
                                      height: 25,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_30_x2.svg',
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
            ],
          ),
        ),
      ),
    );
  }
}
