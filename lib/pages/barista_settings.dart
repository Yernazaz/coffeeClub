import 'package:flutter/material.dart';
import 'package:flutter_app/pages/barista_info.dart';
import 'package:flutter_app/pages/barista_qr_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:flutter_app/pages/register_page.dart';

class BaristaSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Личные данные',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(height: 50),
              buildInfoField('Алексей Андреев', ''),
              buildInfoField('+77777777777', ''),
              Text(
                'Изменить номер',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Настройки приложения',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildInfoField('О приложении', ''),
              buildInfoField('Написать в поддержку', ''),
              buildInfoField('Связаться с владельцем кофейни', ''),
              GestureDetector(
                onTap: () {
                  AuthService().logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: buildInfoField('Выйти с аккаунта', ''),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: BottomAppBar(
            child: Container(
              height: 50,
              color: Color(0xFFFFF4E6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.qr_code, color: Colors.brown),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeScannerPage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.tune, color: Colors.brown),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BaristaSettingsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, String value) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF4B3832), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '$label ',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: label == 'Выйти с аккаунта'
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              TextSpan(
                text: value,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
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
