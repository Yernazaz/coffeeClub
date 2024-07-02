import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFFFFFF),
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
                          'Введите SMS код',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w500,
                            fontSize: 32,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(11),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Color(0xFFFFF4E6),
                          inactiveFillColor: Color(0xFFFFF4E6),
                          selectedFillColor: Color(0xFFFFF4E6),
                          activeColor: Color(0xFFFFF4E6),
                          inactiveColor: Color(0xFFFFF4E6),
                          selectedColor: Color(0xFFFFF4E6),
                        ),
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFBE9B7B),
                        ),
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4B3832),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Подтвердить',
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
