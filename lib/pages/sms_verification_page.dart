import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? password;

  @override
  void initState() {
    super.initState();
    _loadPassword();
  }

  Future<void> _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      password = prefs.getString('user_password');
    });
  }

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (password == null) {
        throw Exception('Password not found');
      }

      final tokens = await _authService.verifyOtp(
          widget.phone, _otpController.text, password!);

      // Navigate to the next page
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при вводе кода!')),
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
              Padding(
                padding: EdgeInsets.fromLTRB(31.2.w, 380.h, 30.5.w, 0),
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
                            fontSize: 32.sp,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5.r),
                          fieldHeight: 50.h,
                          fieldWidth: 40.w,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Color(0xFFEEEEEE),
                          selectedFillColor: Colors.white,
                          activeColor: Color(0xFF4B3832),
                          inactiveColor: Color(0xFFCCCCCC),
                          selectedColor: Color(0xFF4B3832),
                        ),
                        textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: Color(0xFF4B3832),
                        ),
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
                      onTap: _verifyOtp,
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
                                  'Подтвердить',
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
