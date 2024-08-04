import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:flutter_app/pages/auth/register_page.dart';
import 'package:flutter_app/pages/customer/settings_edit.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? userName;
  String? userPhone;
  String? profilePic;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'Алиса';
      userPhone = prefs.getString('user_phone') ?? '+77777777777';
      profilePic = prefs.getString('profile_pic');
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFFF6E5CE),
        body: Column(
          children: [
            SizedBox(height: 60),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Coffee Club',
                    style: GoogleFonts.getFont(
                      'Sanchez',
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                      height: 1,
                      color: Color(0xFF4B3832),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          backgroundImage: profilePic != null
                              ? NetworkImage(profilePic!)
                              : AssetImage(
                                  'assets/images/default_profile_pic.png',
                                ) as ImageProvider,
                        ),
                        SizedBox(
                            width:
                                16), // Adjust the space between avatar and card
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName ?? 'Алиса',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: Color(0xFF4B3832),
                                    ),
                                  ),
                                  Text(
                                    userPhone ?? '+77777777777',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: const Color(0xFF4B3832),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalInfoPage(),
                                        ),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'ред.',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      title: Text('Поддержка'),
                      onTap: () {},
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(height: 8),
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          AuthService().logout();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                          'Выйти',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF4B3832),
                          ),
                        ),
                      ),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
