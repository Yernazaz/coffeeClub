import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sms_verification_page.dart';
import 'package:flutter_app/pages/wave.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  // Mask formatter for Kazakhstan phone number format
  final _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    initialText: '+7',
  );

  void _sendOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Пароли не совпадают')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      String phoneNumber = _phoneController.text.replaceAll(RegExp(r'\s+'), '');
      print('Sending OTP to: $phoneNumber, Name: ${_nameController.text}');
      await _authService.sendOtp(phoneNumber, _nameController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', _nameController.text);
      await prefs.setString('user_phone', _phoneController.text);
      await prefs.setString('user_password', _passwordController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SmsVerificationPage(
            phone: phoneNumber,
          ),
        ),
      );
    } catch (e) {
      print('Error sending OTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send OTP')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 345.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        color: Color(0xFF4B3832),
                        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 70.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Добро пожаловать в',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w800,
                                fontSize: 32.sp,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Text(
                              'Coffee club',
                              style: GoogleFonts.getFont(
                                'Sanchez',
                                fontWeight: FontWeight.w400,
                                fontSize: 60.sp,
                                color: Color(0xFFFFF4E6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180.h,
                      child: SvgPicture.asset(
                        'assets/vectors/container_x2.svg',
                        width: MediaQuery.of(context).size.width,
                        height: 165.5.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 140.h,
                      child: Image.asset(
                        'assets/images/image_15.png',
                        width: 180.w,
                        height: 195.h,
                      ),
                    ),
                    Positioned(
                      right: 130.w,
                      top: 230.h,
                      child: SvgPicture.asset(
                        'assets/vectors/star_11_x2.svg',
                        width: 11.w,
                        height: 12.h,
                      ),
                    ),
                    Positioned(
                      right: 50.w,
                      top: 180.h,
                      child: SvgPicture.asset(
                        'assets/vectors/star_2_x2.svg',
                        width: 14.w,
                        height: 15.h,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(31.2.w, 0, 30.5.w, 100),
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
                            fontSize: screenHeight * 0.04,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Войти',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: screenHeight * 0.025,
                              decoration: TextDecoration.underline,
                              color: Color(0xFFBE9B7B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      margin: EdgeInsets.only(bottom: 14.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: TextField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_phoneFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ваше имя:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 14.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: TextField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: [_phoneMaskFormatter],
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Номер телефона:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 14.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Пароль:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: TextField(
                        controller: _confirmPasswordController,
                        focusNode: _confirmPasswordFocusNode,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Подтверждение пароля:',
                          hintStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xFF4B3832).withOpacity(0.6),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _sendOtp,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Color(0xFF4B3832),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFFFF4E6)),
                                )
                              : Text(
                                  'Получить SMS код',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
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
