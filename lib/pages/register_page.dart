import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/auth/auth_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'sms_verification_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  // Mask formatter for Kazakhstan phone number format
  final _phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7##########',
    filter: {"#": RegExp(r'[0-9]')},
    initialText: '+7',
  );

  void _sendOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      print('Sending OTP to: ${_phoneController.text}, Name: ${_nameController.text}');
      await _authService.sendOtp(_phoneController.text, _nameController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SmsVerificationPage(
            phone: _phoneController.text,
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
                  fit: BoxFit.cover,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                          },
                          child: Text(
                            'Войти',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              color: Color(0xFFBE9B7B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 14),
                      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11),
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
                      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF4E6),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        inputFormatters: [_phoneMaskFormatter],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Номер телефона:',
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
                    GestureDetector(
                      onTap: _sendOtp,
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
