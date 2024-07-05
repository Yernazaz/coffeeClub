import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/backend/auth/auth_service.dart';
import 'package:flutter_app/pages/best_places.dart'; // Adjust the import based on your project structure

class SmsVerificationPage extends StatefulWidget {
  final String phone;

  SmsVerificationPage({required this.phone});

  @override
  _SmsVerificationPageState createState() => _SmsVerificationPageState();
}

class _SmsVerificationPageState extends State<SmsVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final tokens =
          await _authService.verifyOtp(widget.phone, _otpController.text);

      // Save tokens securely
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', tokens['access']!);
      await prefs.setString('refresh_token', tokens['refresh']!);

      // Navigate to the next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Color(0xFFEEEEEE),
                          selectedFillColor: Colors.white,
                          activeColor: Color(0xFF4B3832),
                          inactiveColor: Color(0xFFCCCCCC),
                          selectedColor: Color(0xFF4B3832),
                        ),
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF4B3832),
                        ),
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: _verifyOtp,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF4B3832),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFFFF4E6)),
                                )
                              : Text(
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
