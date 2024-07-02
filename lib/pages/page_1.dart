import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final _nameFocusNode = FocusNode();
  final _phoneEmailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  color: Color(0xFF4B3832),
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Добро пожаловать в',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        'Coffee club',
                        style: GoogleFonts.getFont(
                          'Sanchez',
                          fontWeight: FontWeight.w400,
                          fontSize: 60,
                          color: Color(0xFFFFF4E6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 180,
                child: SvgPicture.asset(
                  'assets/vectors/container_x2.svg',
                  width: MediaQuery.of(context).size.width,
                  height: 165.5,
                ),
              ),
              Positioned(
                right: 0,
                top: 140,
                child: Image.asset(
                  'assets/images/image_15.png',
                  width: 180,
                  height: 195,
                ),
              ),
              Positioned(
                right: 130,
                top: 230,
                child: SvgPicture.asset(
                  'assets/vectors/star_11_x2.svg',
                  width: 11,
                  height: 12,
                ),
              ),
              Positioned(
                right: 50,
                top: 180,
                child: SvgPicture.asset(
                  'assets/vectors/star_2_x2.svg',
                  width: 14,
                  height: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(31.2, 380, 30.5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Регистрация',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w500,
                            fontSize: 32,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                        Text(
                          'Войти',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Color(0xFFBE9B7B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 14),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        focusNode: _nameFocusNode,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_phoneEmailFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ваше имя:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        focusNode: _phoneEmailFocusNode,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Номер телефона или email:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Придумайте пароль:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF4B3832),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4B3832),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Получить SMS код',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFFFFF4E6),
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
    );
  }
}
