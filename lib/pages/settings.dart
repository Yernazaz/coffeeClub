import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:flutter_app/pages/register_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6E5CE),
      body: Column(
        children: [
          SizedBox(height: 60), // Add a SizedBox to create the top margin
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
                                Text('Алиса'),
                                Text('+77777777777'),
                                Align(
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
                  SizedBox(height: 8),
                  ListTile(
                    title: Text('Настройки'),
                    onTap: () {},
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  SizedBox(height: 24),
                  // ListTile(
                  //   trailing: SvgPicture.asset(
                  //     'assets/vectors/group_3_x2.svg',
                  //     width: 24,
                  //     height: 24,
                  //   ),
                  //   title: Text('Инструменты для владельца кафе'),
                  //   onTap: () {},
                  //   tileColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  // ListTile(
                  //   trailing: SvgPicture.asset(
                  //     'assets/vectors/vector_16_x2.svg',
                  //     width: 24,
                  //     height: 24,
                  //   ),
                  //   title: Text('Инструменты для кафе-бариста'),
                  //   onTap: () {},
                  //   tileColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  // ListTile(
                  //   title: Text('Менеджер кофейни'),
                  //   onTap: () {},
                  //   tileColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  // ListTile(
                  //   title: Text('Администратор кофейни'),
                  //   onTap: () {},
                  //   tileColor: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        AuthService().logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
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
    );
  }
}
