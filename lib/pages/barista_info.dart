import 'package:flutter/material.dart';
import 'package:flutter_app/pages/barista_qr_code.dart';
import 'package:flutter_app/pages/barista_settings.dart';
import 'package:google_fonts/google_fonts.dart';

class BaristaInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Coffee Club',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF4B3832),
                  ),
                ),
              ),
            ),
            SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Бариста: ',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Алексей Андреев',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            buildInfoField('Имя клиента:', 'Алиса Орлова'),
            buildInfoField('Количество заказов:', '7'),
            buildInfoField('Сколько заказали сейчас:', '7'),
            buildInfoField('Сколько промо куплено:', '7'),
            buildInfoField('Подписка:', ''),
            buildInfoField('Permanent client discount:', ''),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4B3832),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Выдать чашку кофе',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4B3832),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Выдать подписку',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.delete, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  'Удалить последнюю запись',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.qr_code, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  'Сканированные сегодня:',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  ' 7',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
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
                IconButton(
                  icon: Icon(Icons.coffee, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BaristaInfoPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, String value) {
    return Container(
      width: double.infinity,
      height: 40, // Adjusted height for single line
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
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              TextSpan(
                text: value,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: TextStyle(
                    fontSize: 15,
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
